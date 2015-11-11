class ChangeThings < ActiveRecord::Migration
  def change
  		add_column :users, :password_salt, :string
  		rename_column :users, :password, :password_hash
  		remove_column :users, :password_digest, :string

  end
end
