class AddAttachmentUploadFileToAssets < ActiveRecord::Migration
  def self.up
    change_table :assets do |t|
      t.attachment :upload_file
    end
  end

  def self.down
    drop_attached_file :assets, :upload_file
  end
end
