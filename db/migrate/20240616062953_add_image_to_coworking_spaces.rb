class AddImageToCoworkingSpaces < ActiveRecord::Migration[7.0]
  def change
    add_column :coworking_spaces, :image, :string
  end
end
