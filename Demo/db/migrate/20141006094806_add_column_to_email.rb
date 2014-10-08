class AddColumnToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :subject, :string
    add_column :emails, :content, :string
  end
end
