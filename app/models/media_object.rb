class MediaObject < ActiveRecord::Base
	belongs_to :work

	mount_uploader :image, MediaUploader
	
end
