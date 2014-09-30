class AddMailBoxIdToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :mailbox_one_id, :integer
    add_column :contacts, :mailbox_two_id, :integer
  end
end
