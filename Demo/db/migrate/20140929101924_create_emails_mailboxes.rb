class CreateEmailsMailboxes < ActiveRecord::Migration
  def change
    create_table :emails_mailboxes do |t|
      t.belongs_to :email
      t.integer :receiver_mailbox_id
    end
  end
end
