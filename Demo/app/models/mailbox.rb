# Fixed: added dependent=> :destroy 
class Mailbox < ActiveRecord::Base
  has_many :mails, class_name: Email, foreign_key: 'sender_mailbox_id', dependent: :destroy
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # using association extension
  has_many :mails, class_name: Email, foreign_key: 'sender_mailbox_id', dependent: :destroy do
    def find_spam_mails
      find_by(spam: true)
    end
  end
  has_and_belongs_to_many :emails, foreign_key: 'receiver_mailbox_id'

  has_many :contacts_one, class_name: Contact, foreign_key: :mailbox_one_id, dependent: :destroy
  has_many :mailboxes_one, class_name: Mailbox, through: :contacts_one, source: :mailbox_one
  has_many :contacts_two, class_name: Contact, foreign_key: :mailbox_two_id, dependent: :destroy
  has_many :mailboxes_two, class_name: Mailbox, through: :contacts_two, source: :mailbox_one
  
  validates :firstname, :lastname, :email, presence: true
  validates :score, numericality: { only_integer: true, less_than_or_equal_to: 5 }
  validates :email, uniqueness: { case_sensitive: false }

  before_destroy :destroy_if_no_non_spam_email?, prepend: true
  
  private
# destroy mailbox if there is no non-spam mails
  def destroy_if_no_non_spam_email?
    mails.all? { |mail| mail.spam }
  end
  

end
