class Campaign < ActiveRecord::Base

	has_one :planning
	accepts_nested_attributes_for :planning

	CAMPAIGN_STATUSES = ["Planned", "Ongoing", "Ended"]
	CAMPAIGN_TYPES = ["Promotional", "Educational", "Entertaining", "Professional"]


	validates_presence_of :name
	validates_uniqueness_of :name
	validates_length_of :name, :maximum => 50

	validates_inclusion_of :status, :in => CAMPAIGN_STATUSES, :allow_blank => true
	validates_inclusion_of :type, :in => CAMPAIGN_TYPES, :allow_blank => true

end
