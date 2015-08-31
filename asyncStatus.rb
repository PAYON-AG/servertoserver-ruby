#!/usr/bin/env ruby
require 'net/https'
require 'uri'
require 'json'

def request()
	path = ("?authentication.userId=8a8294174b7ecb28014b9699220015cc" +
		"&authentication.password=sy6KJsT8" +
		"&authentication.entityId=8a8294174b7ecb28014b9699220015ca")
	uri = URI.parse('https://test.oppwa.com/v1/payments/8a82944a4f72f757014f839bf3e8574a' + path)
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	res = http.get(uri.request_uri)
	return JSON.parse(res.body)
end

puts request()
