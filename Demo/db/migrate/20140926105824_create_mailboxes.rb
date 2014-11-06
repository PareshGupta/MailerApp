class CreateMailboxes < ActiveRecord::Migration
  def change
    create_table :mailboxes do |t|
      t.string :firstname
      t.string :lastname
      t.timestamps
    end
  end
end
