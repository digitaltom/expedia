# useful tools
require 'digest/md5'
require 'multi_json'

# include koala modules
require 'expedia/errors'
require 'expedia/api'

# HTTP module so we can communicate with Expedia
require 'expedia/http_service'

# miscellaneous
require 'expedia/utils'
require 'expedia/version'

module Expedia

	class << self

		attr_accessor :cid, :api_key, :shared_secret, :format, :locale,
			:currency_code, :minor_rev

		# Default way to setup Devise. Run generator to create
		# a fresh initializer with all configuration values.
		def setup
		  yield self
		end

	end
	
end