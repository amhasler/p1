CarrierWave.configure do |config|
	config.storage = :fog
	config.fog_credentials = {
		provider: ENV['FOG_PROVIDER'],
    region: ENV['AWS_REGION'],
		aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
		aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
	}
	config.fog_directory  = ENV['FOG_DIRECTORY']
	config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
  # config.asset_host = "//#{ENV['CLOUDFRONT_CDN']}"
end