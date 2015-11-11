class AddAttachmentMilktarToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :milktar
    end
  end

  def self.down
    remove_attachment :posts, :milktar
  end
end
