class Contact < ActiveRecord::Base
  # FIXME_AK: Why the contact is belonging to two mailboxes?
  # discuss it 
  belongs_to :mailbox_one, class_name: Mailbox
  belongs_to :mailbox_two, class_name: Mailbox
end
