class Campaign < ActiveRecord::Base

	has_one :planning
	accepts_nested_attributes_for :planning

	CAMPAIGN_STATUSES = ["Planned", "Ongoing", "Ended"]
	CAMPAIGN_TYPES = ["Promotional", "Educational", "Entertaining", "Professional"]

end
