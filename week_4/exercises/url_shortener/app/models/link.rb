class Link < ActiveRecord::Base
	def self.check_url(url)
		if url =~ /http:\/\// || url =~ /https:\/\//
			url
		else
			add_to_url(url)
		end
	end

	def self.add_to_url(url)
		url.prepend("http://")
		url
	end
end
