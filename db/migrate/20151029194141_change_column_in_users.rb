class ChangeColumnInUsers < ActiveRecord::Migration
  def self.up
  		rename_column :users, :password, :password_hash
  end 
end
