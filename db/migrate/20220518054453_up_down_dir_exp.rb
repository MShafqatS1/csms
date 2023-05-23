class UpDownDirExp < ActiveRecord::Migration[7.0]
  def change

    reversible do |dir|
      
      dir.up do
        rename_column :distributors, :zipcode, :zipchik
      end

      dir.down do
        rename_column :distributors, :email, :user_email
      end

    end

    add_column :distributors, :home_page_url, :string
    rename_column :distributors, :email, :email_address

  end
end