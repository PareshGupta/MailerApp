class Mailbox < ActiveRecord::Base
  validate :ensure_score_less_than_maximum

  has_many :mails, class_name: Email, foreign_key: 'sender_mailbox_id'

  has_and_belongs_to_many :emails, foreign_key: 'receiver_mailbox_id'

  has_many :contacts_one, class_name: Contact, foreign_key: :mailbox_one_id
  has_many :mailboxes_one, class_name: Mailbox, through: :contacts_one, source: :mailbox_one
  has_many :contacts_two, class_name: Contact, foreign_key: :mailbox_two_id
  has_many :mailboxes_two, class_name: Mailbox, through: :contacts_two, source: :mailbox_one

  before_destroy :destroy_if_no_non_spam_email?

# destroy mailbox if there is no non-spam mails
  def destroy_if_no_non_spam_email?
    emails.any? { |email| email.spam == false }
  end

# custom validation for score to be less than maximum score
  def ensure_score_less_than_maximum
    max_score = 5
    if self.score <= max_score
      return true
    else
      errors.add(:score, "can't be greater than 5")
    end
  end

end
