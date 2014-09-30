class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :filename
      t.text :content
      t.belongs_to :e_mail, polymorphic: true
      t.timestamps
    end
  end
end
