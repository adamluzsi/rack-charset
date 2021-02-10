require "rack/charset/version"
require "rack"
module Rack
  class Charset

    DEFAULT_CHARSET = 'utf-8'

    def initialize(app,charset = DEFAULT_CHARSET)
      @app = app
      @charset = charset
    end

    def call(env)
      status, headers, body = @app.call(env)

      if headers['Content-Type'].is_a?(String) && !(headers['Content-Type'] =~ /\bcharset\b/)
        headers['Content-Type']= headers['Content-Type'] + "; charset=#{@charset}"
      elsif headers['Content-Type'].nil?
        headers['Content-Type']= "text/plain; charset=#{@charset}"
      end

      return status, headers, body
    end

  end
end
