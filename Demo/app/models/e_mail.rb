class EMail < ActiveRecord::Base
  belongs_to :mailbox, foreign_key: 'sender_mailbox_id'

  has_and_belongs_to_many :mailboxes, association_foreign_key: 'receiver_mailbox_id'

  has_many :attachments
end
