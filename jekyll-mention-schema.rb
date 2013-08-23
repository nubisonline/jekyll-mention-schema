module Jekyll
	class MentionUserTag < Liquid::Tag
		def initialize(tag_name, text, tokens)
			super
			@text = text.strip
		end

		def render(context)
			rendered_text = Liquid::Template.parse(@text).render(context).gsub(/\\\{\\\{|\\\{\\%/, '\{\{' => '{{', '\{\%' => '{%')
			args = rendered_text.split(' ')
			user_name = args[0]
			property = args[1]
			
			authors = context.registers[:site].config["authors"]
			user = authors[user_name]
			
			itemprop = ""
			if not property.nil?
				itemprop = "itemprop='#{property}'"
			end
			
			"<span #{itemprop} itemscope='' itemtype='http://schema.org/Person'>" +
				"<meta itemprop='name' content='#{user["full_name"]}' />" +
				"<meta itemprop='jobTitle' content='#{user["position"]}' />" +
				"<a href='https://plus.google.com/#{user["gplus_id"]}' itemprop='url'>#{user["display_name"]}</a>" +
			"</span>"
		end
	end
end

Liquid::Template.register_tag('mention', Jekyll::MentionUserTag)
