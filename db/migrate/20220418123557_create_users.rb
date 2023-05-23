class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :fname
      t.string :mname
      t.string :address, null: false
      t.string :number, null: false
      t.string :email, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
