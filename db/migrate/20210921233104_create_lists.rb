class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.integer :visibility
      t.datetime :date_created
      t.datetime :date_updated

      t.timestamps
    end
  end
end
