class ChangeDataSizeToItems < ActiveRecord::Migration[5.2]
  def change
  	change_column :items, :size, :string
  end
end
