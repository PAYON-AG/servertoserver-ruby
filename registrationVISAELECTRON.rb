#!/usr/bin/env ruby

require 'net/https'
require 'uri'
require 'json'
 
def registration()
	uri = URI('https://test.oppwa.com/v1/registrations')
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	req = Net::HTTP::Post.new(uri.path)
	req.set_form_data({
	  'authentication.userId' => '8a8294174b7ecb28014b9699220015cc',
	  'authentication.password' => 'sy6KJsT8',
	  'authentication.entityId' => '8a8294174b7ecb28014b9699a3cf15d1',
	  'paymentBrand' => 'VISAELECTRON',
	  'card.number' => '4917300800000000',
	  'card.holder' => 'Jane Jones',
	  'card.expiryMonth' => '05',
	  'card.expiryYear' => '2018',
	  'card.cvv' => '123'
	})
	return JSON.parse(http.request(req).body)
end

puts registration()