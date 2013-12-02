class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :email
      t.string :string
      t.datetime :requested_date
      t.string :message
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
