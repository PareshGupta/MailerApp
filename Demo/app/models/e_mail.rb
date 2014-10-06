class EMail < ActiveRecord::Base
  belongs_to :mailbox, foreign_key: 'sender_mailbox_id'
  has_and_belongs_to_many :mailboxes, association_foreign_key: 'receiver_mailbox_id'
  has_many :attachments
  
  before_save :check_subject
  before_save :check_for_valid_attachment

# save email if subject given
  def check_subject
    if self.subject.nil?
      p 'No Subject'
      return false
    else
      p 'Subject Present'
    end
  end

# save email to spam if attachement is type = 'Text'
  def check_for_valid_attachment
    if self.attachments.any? { |attachment| attachment.type == 'Text' }
      self.spam = true
    else
      return true
    end
  end

end
