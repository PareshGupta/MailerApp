# Fixed: class name from EMail to Email.
# Fixed: attachment gets destroy if emails get deleted.

class Email < ActiveRecord::Base
  belongs_to :mailbox, foreign_key: 'sender_mailbox_id'
  has_and_belongs_to_many :mailboxes, association_foreign_key: 'receiver_mailbox_id'
  has_many :attachments, dependent: :destroy
  
  validate :count_in_mailbox_less_than_three?, on: :create
  
  define_model_callbacks :sending
  before_save :check_count_of_total_recipients_less_than_3?
  before_save :add_default_subject, if: Proc.new { |mail| mail.subject.nil? }
  after_create :add_contact

# custom callback
  def sending
    ActiveRecord::Base.transaction do
      run_callbacks :sending do
        insert_details_to_log
      end
    end
  end

  private
# adding default subject value 
  def add_default_subject
    self.subject = 'IMPORTANT!!!'
  end

# maximum no of mails in a mailbox be 3
  def count_in_mailbox_less_than_three?
    mailbox = Mailbox.find(sender_mailbox_id)
    if mailbox.mails.count > 2
      errors[:base] << 'Mailbox cannot have more than 2 mails'
    end
  end

# inserting the mailing info to the log
  def insert_details_to_log
    mailbox = Mailbox.find(self.sender_mailbox_id)
    log = Log.create(information: "#{ mailbox.firstname } send email with subject #{ self.subject }")
  end

# maximum number of recipients be 3
  def check_count_of_total_recipients_less_than_3?
    mailboxes.size <= 3
  end

  def add_contact
    mailbox_array = mailboxes
    mailbox_array.each do |mailbox|
      Contact.create(firstname: mailbox.firstname, lastname: mailbox.lastname, mailbox_one_id: mailbox.id, mailbox_two_id: self.sender_mailbox_id)
    end
  end
end
