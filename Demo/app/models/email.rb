class Email < ActiveRecord::Base
  validates :subject, presence: { message: 'No subject given' }
  belongs_to :mailbox, foreign_key: 'sender_mailbox_id'
  has_and_belongs_to_many :mailboxes, association_foreign_key: 'receiver_mailbox_id'
  
  has_many :attachments, dependent: :destroy
  
  before_save :check_for_valid_attachment?
  before_save :check_count_in_mailbox?

  define_model_callbacks :email_send, only: :after
  after_email_send :insert_details_to_log


# save email to spam if attachement is type = 'Text'
# FIXME_AK: this method will always return true. Correct the implementation.
# FIXME_AK: shouldn't these be the part of validation?
  def check_for_valid_attachment?
    if attachments.any? { |attachment| attachment.type == 'Text' }
      spam = true
    else
      return true 
    end
  end

# maximum no of mails in a mailbox be 2
  def check_count_in_mailbox?
    mailbox = Mailbox.find(sender_mailbox_id)
    mailbox.emails.count < 2
  end

# custom callbacks
  def email_send
    run_callbacks :email_send do
      puts 'around send'
    end
  end

  private

  def insert_details_to_log
    mailbox = Mailbox.find(self.sender_mailbox_id)
    log = Log.create(information: "#{ mailbox.firstname } send email with subject #{ self.subject }")
  end

end
