  class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.belongs_to :senior_id
      t.timestamp
    end
  end
end
