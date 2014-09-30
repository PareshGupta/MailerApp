class CreateEMailsMailboxes < ActiveRecord::Migration
  def change
    create_table :e_mails_mailboxes do |t|
      t.belongs_to :e_mail
      t.integer :receiver_mailbox_id
    end
  end
end
