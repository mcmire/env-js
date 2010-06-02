require 'httpclient'

module Envjs
  class HTTPClient < ::HTTPClient
    def request(*args)
      msg = super
      msg.extend(HTTPMessageMethods)
      msg
    end
  end
  module HTTPMessageMethods
    def each
      header.all.each do |k, v|
        yield k, v
      end
    end
    def [](key)
      header[key]
    end
  end
end