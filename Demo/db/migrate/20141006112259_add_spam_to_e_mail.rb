class AddSpamToEMail < ActiveRecord::Migration
  def change
    add_column :e_mails, :spam, :boolean, default: false
  end

end
