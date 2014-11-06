class Contact < ActiveRecord::Base
  belongs_to :mailbox_one, class_name: Mailbox
  belongs_to :mailbox_two, class_name: Mailbox

  validates :firstname, :lastname, :phone_number, :address, presence: true
  validates :phone_number, length: { is: 10 }
  validates :mailbox_one_id, uniqueness: { scope: :mailbox_two_id }
end
