# Taken from https://borgs.cybrilla.com/tils/generate-md5-hash-for-gravatar-with-liquid/

require 'digest/md5'

	module Jekyll
	  module GravatarFilter
	    def gravatar_url(email, size)
	      "//www.gravatar.com/avatar/#{hash(email)}?s=#{size}"
	    end

	    private :hash

	    def hash(email)
	      email_address = email ? email.downcase.strip : ''
	      Digest::MD5.hexdigest(email_address)
	    end
	  end
	end

	Liquid::Template.register_filter(Jekyll::GravatarFilter)
