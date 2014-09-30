class Contact < ActiveRecord::Base
  belongs_to :mailbox_one, class_name: Mailbox
  belongs_to :mailbox_two, class_name: Mailbox
end
