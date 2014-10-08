class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :sender_mailbox_id
      t.timestamps
    end
  end
end
