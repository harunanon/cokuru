class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.bigint :user_id, null: false, foreign_key: true
      t.bigint :coworking_space_id, null: false, foreign_key: true
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.timestamps
    end

    add_foreign_key :reservations, :users, column: :user_id
    add_foreign_key :reservations, :coworking_spaces, column: :coworking_space_id
  end
end
 