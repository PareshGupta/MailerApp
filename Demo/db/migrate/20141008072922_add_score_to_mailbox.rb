class AddScoreToMailbox < ActiveRecord::Migration
  def change
    add_column :mailboxes, :score, :integer, default: 0
  end
end
