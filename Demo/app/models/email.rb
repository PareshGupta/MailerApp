class Email < ActiveRecord::Base
  validates :subject, presence: { message: 'No subject given' }
  belongs_to :mailbox, foreign_key: 'sender_mailbox_id'
  has_and_belongs_to_many :mailboxes, association_foreign_key: 'receiver_mailbox_id'
  
  # FIXME_AK: Do we need to keep the attachments when the email is destroyed.
  has_many :attachments
  
  before_save :check_for_valid_attachment?
  before_save :check_count_in_mailbox?

# save email to spam if attachement is type = 'Text'
# FIXME_AK: this method will always return true. Correct the implementation.
# FIXME_AK: shouldn't these be the part of validation?
  def check_for_valid_attachment?
    if self.attachments.any? { |attachment| attachment.type == 'Text' }
      self.spam = true
    else
      return true 
    end
  end

# maximum no of mails in a mailbox be 2
  def check_count_in_mailbox?
    mailbox = Mailbox.find(sender_mailbox_id)
    mailbox.emails.count < 2
  end

end
