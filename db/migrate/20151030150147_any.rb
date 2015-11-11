class Any < ActiveRecord::Migration
  def change
  		remove_column :users, :password_salt
  		rename_column :users, :password_hash, :password
  end

end
