class CreateEMails < ActiveRecord::Migration
  def change
    create_table :e_mails do |t|
      t.integer :sender_mailbox_id
      t.timestamps
    end
  end
end
