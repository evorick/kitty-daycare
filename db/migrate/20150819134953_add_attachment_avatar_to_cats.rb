class AddAttachmentAvatarToCats < ActiveRecord::Migration
  def self.up
    change_table :cats do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :cats, :avatar
  end
end
