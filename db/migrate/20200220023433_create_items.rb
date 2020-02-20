class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :price
      t.text :item_image_id
      t.text :body
      t.string :title
      t.integer :user_id
      t.integer :size

      t.timestamps
    end
  end
end
