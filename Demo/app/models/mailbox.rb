class Mailbox < ActiveRecord::Base
  # FIXME_AK: Do we really need the on option here?
  validate :ensure_score_less_than_maximum, on: [:update, :create]
  has_many :mails, class_name: EMail, foreign_key: 'sender_mailbox_id'

  has_and_belongs_to_many :e_mails, foreign_key: 'receiver_mailbox_id'

  has_many :contacts_one, class_name: Contact, foreign_key: :mailbox_one_id
  has_many :mailboxes_one, class_name: Mailbox, through: :contacts_one, source: :mailbox_one
  has_many :contacts_two, class_name: Contact, foreign_key: :mailbox_two_id
  has_many :mailboxes_two, class_name: Mailbox, through: :contacts_two, source: :mailbox_one

  before_destroy :check_for_spam


# destroy mailbox if there is no spam mails
# FIXME_AK: Refactor this method.
  def check_for_spam
    if self.e_mails.any? { |email| email.spam == false }
      return false
    else
      return true
    end
  end

# custom validation for score to be less than maximum score
  def ensure_score_less_than_maximum
    max_score = 5
    if self.score < max_score
      return true
    else
      errors.add(:score, "can't be greater than 5")
    end
  end

end
