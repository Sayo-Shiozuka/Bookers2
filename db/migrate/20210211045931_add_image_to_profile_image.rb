class AddImageToProfileImage < ActiveRecord::Migration[5.2]
  def change
    add_column :profile_images, :image, :string
  end
end
