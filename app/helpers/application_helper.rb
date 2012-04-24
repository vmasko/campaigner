# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def full_title(page_title)
		base_title = "Campaigner"
		if page_title
			"#{base_title} | #{page_title}"
		else
			base_title
		end
	end

	def sortable(column, name = nil)
		name ||= column.titleize
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		column == sort_column && sort_direction == "asc" ? arrow_direction = "&darr;" : arrow_direction = "&uarr;"
		link_to "#{name} #{arrow_direction}", :sort => column, :direction => direction
	end

	def context_button
		if action_name == "clone_campaign"
			"Clone"
		else
			"Save"
		end
	end

	def active_check
		if @campaign.active
			"✔"
		else
			"×"
		end
	end

	def mark_inactive(campaign)
		campaign.active? == true ? "#{campaign.name}" : "#{campaign.name} | inactive"
	end
end
