class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.date :appdate, null: false
      t.string :location
      t.string :techname

      t.timestamps
    end
  end
end
