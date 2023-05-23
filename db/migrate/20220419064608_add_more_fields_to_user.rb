class AddMoreFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :dob, :date
    add_column :users, :role, :string, default: "Customer"
  end
end
