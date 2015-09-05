class Work < ActiveRecord::Base
	acts_as_taggable
	acts_as_taggable_on :creators, :locations, :languages, 
		:periods, :mediums

	geocoded_by :place
	after_validation :geocode

	has_many :media_objects
	has_many :resource_objects

	validates :title, presence: true, length: { maximum: 40 }
	validates :min_year, presence: true, length: { maximum: 4}
	validates :place, presence: true

	default_scope -> { order('created_at DESC') }

	def featured_image
		return self.media_objects.where(featured: true).first
	end

end
