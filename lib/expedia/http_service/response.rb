module Expedia

  module HTTPService

    class Response

      attr_reader :status, :body, :headers

      # Creates a new Response object, which standardizes the response received From Expedia.
      def initialize(status, body, headers)
        @status = status
        @body = MultiJson.load(body) rescue ''
        @headers = headers
      end

      # Simple predicate method to check if there is any exception
      def exception?
        @headers['content-type'] != 'application/json' ||
          (@body && @body[@body.keys[0]]['EanWsError']) ? true : false
      end

      # extract different types of exceptions
      def exception
        if @body['HotelListResponse'] && @body['HotelListResponse']['LocationInfos']
          MultipleLocationsFoundError.new(status, body)
        else
          Expedia::APIError.new(status, body)
        end
      end

    end

  end

end
