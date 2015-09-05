# encoding: utf-8

class MediaUploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes
  include CarrierWave::RMagick

  # Full images are maximal 1920px wide and 1920px high
  FULL_IMAGE_SIZE = 1920

  process :set_content_type

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage ( (Rails.env.production?) ? :fog : :file )

  # Override the directory where uploaded files will be stored.
  def store_dir
    if model
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    else
      "uploads/assets"
    end
  end

end
