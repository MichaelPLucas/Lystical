class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :list_id
      t.string :title
      t.text :description
      t.text :image
      t.decimal :price
      t.integer :currency
      t.text :link
      t.datetime :date_added

      t.timestamps
    end
  end
end
