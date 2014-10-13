# Fixed: remove Polymorphic association, no need
# Fixed: convert_to_spam_email method in validation
class Attachment < ActiveRecord::Base
  belongs_to :email

  validates :filename, :type, :email_id, presence: true
  validate :convert_to_spam_email, if: Proc.new { |attachment| attachment.type == 'Text'}

# save email to spam if attachement is type = 'Text'
  def convert_to_spam_email
    email = Email.find(email_id)
    email.spam = true
    email.save
  end
end
