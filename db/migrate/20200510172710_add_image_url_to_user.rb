class AddImageUrlToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :image_url, :string
    add_column :posts, :image_url, :string
  end
end
