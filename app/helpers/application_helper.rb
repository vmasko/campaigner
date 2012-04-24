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
		sort_direction == "asc" ? arrow_direction = "&darr;" : arrow_direction = "&uarr;"
		link_to "#{name} #{arrow_direction}", :sort => column, :direction => direction
	end
end
