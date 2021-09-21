class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :list_id
      t.integer :user_id
      t.text :text
      t.datetime :date_posted
      t.datetime :date_updated

      t.timestamps
    end
  end
end
