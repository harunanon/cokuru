class CreateCoworkingSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :coworking_spaces do |t|
        t.string :name
        t.text :description
        t.string :location
        t.decimal :price, precision: 8, scale: 2
  
      t.timestamps
    end
  end
end
