#!/usr/bin/env ruby

require 'net/https'
require 'uri'
require 'json'
 
def deleteRegistration(registrationId)
	path = ("?authentication.userId=8a8294174b7ecb28014b9699220015cc" +
		"&authentication.password=sy6KJsT8" +
		"&authentication.entityId=8a8294174b7ecb28014b9699a3cf15d1")
	
	uri = URI.parse("https://test.oppwa.com/v1/registrations/" + registrationId + path)
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	res = http.delete(uri.request_uri)
	
	return JSON.parse(res.body)
end

puts deleteRegistration("8a82944a4cfff62d014d0540d73600c4")