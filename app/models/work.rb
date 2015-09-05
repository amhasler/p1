class Work < ActiveRecord::Base
	acts_as_taggable
	acts_as_taggable_on :creators, :locations, :languages, 
		:periods, :mediums

	has_many :media_objects
	has_many :resource_objects

	validates :title, presence: true, length: { maximum: 40 }
	validates :minyear, presence: true, length: { maximum: 4}
	validates :place, presence: true

	default_scope -> { order('created_at DESC') }

end
