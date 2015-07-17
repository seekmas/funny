module ApplicationHelper

	def person_card(user_name,avatar)


		content_tag(:a, :class => "box-p-button") do
			content_tag(:div, :class => "box-p") do
				
				content_tag(:h4, :class => "box-p-name") do
					user_name
				end +
				
				# list.to_a.each do |user_attr|
				# 	content_tag(:div, :class => "box-p-info") do
				# 		user_attr.inspect
				# 	end
				# end +
				content_tag(:span) do
					image_tag(avatar, :class => "box-p-avatar")
				end

			end
		end
	end

end
