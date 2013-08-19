module Jekyll
	class MentionUserTag < Liquid::Tag
		def initialize(tag_name, text, tokens)
			super
			@text = text.strip
		end

		def render(context)
			authors = context.registers[:site].config["authors"]
			user = authors[@text]
			
			"<span itemscope='' itemtype='http://schema.org/Person'>" +
				"<meta itemprop='name' content='#{user["full_name"]}' />" +
				"<meta itemprop='jobTitle' content='#{user["position"]}' />" +
				"<a href='https://plus.google.com/#{user["gplus_id"]}' itemprop='url'>#{user["display_name"]}</a>" +
			"</span>"
		end
	end
end

Liquid::Template.register_tag('mention', Jekyll::MentionUserTag)
