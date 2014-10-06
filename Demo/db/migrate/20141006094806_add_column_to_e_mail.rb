class AddColumnToEMail < ActiveRecord::Migration
  def change
    add_column :e_mails, :subject, :string
    add_column :e_mails, :content, :string
  end
end
