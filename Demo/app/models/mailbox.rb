class Mailbox < ActiveRecord::Base
  validates :score, numericality: { only_integer: true, less_than_or_equal_to: 5 }

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

end
