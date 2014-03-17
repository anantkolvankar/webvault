class Asset < ActiveRecord::Base
	has_attached_file :upload_file, :url => "/assets/get/:id", :path => ":rails_root/public/assets/:id/:basename.:extension"
 # validates_attachment_content_type :upload_file, :content_type => /\Aimage\/.*\Z/
  # Validate content type
  #validates_attachment_content_type :upload_file, :content_type => /\Aimage/
# Validate filename
  #validates_attachment_file_name :upload_file, :matches => [/png\Z/, /jpe?g\Z/]
 do_not_validate_attachment_file_type :upload_file
 #mount_uploader :upload_file, UploadFileUploader
  belongs_to :user

#f=model method to return file name
def file_name  
 upload_file_file_name  
end  

def file_size  
  upload_file_file_size  
end

end