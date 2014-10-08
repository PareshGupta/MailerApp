class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :filename
      t.text :content
      t.belongs_to :email, polymorphic: true
      t.timestamps
    end
  end
end
