class CreateCoworkingSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :coworking_spaces do |t|
        t.string :name, null: false
        t.string :address, null: false
        t.text :description, null: false
        t.decimal :price, null: false, precision: 10, scale: 2
        t.text :amenities, null: false
        t.bigint :admin_id, null: false, foreign_key: true
  
        t.timestamps
      end
  
      add_foreign_key :coworking_spaces, :users, column: :admin_id
    end
  end