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
end
