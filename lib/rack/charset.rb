require "rack/charset/version"
require "rack/response"
module Rack
  class Charset

    DEFAULT_CHARSET = 'utf-8'

    def initialize(app,charset = DEFAULT_CHARSET)
      @app = app
      @charset = charset
    end

    def call(env)
      status, headers, body = @app.call(env)

      content_type = headers['Content-Type']

      p headers 
      if content_type.is_a?(String) && !(content_type =~ /\bcharset\b/)
        headers['Content-Type']= content_type + "; charset=#{@charset}"
      end

      return status, headers, body
    end

  end
end
