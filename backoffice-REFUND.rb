#!/usr/bin/env ruby

require 'net/https'
require 'uri'
require 'json'
 
def backofficeOperation()
	uri = URI('https://test.oppwa.com/v1/payments/8a82944a4cdca5cc014ce070ad2e4a3f')
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	req = Net::HTTP::Post.new(uri.path)
	req.set_form_data({
	  'authentication.userId' => '8a8294174b7ecb28014b9699220015cc',
	  'authentication.password' => 'sy6KJsT8',
	  'authentication.entityId' => '8a8294174b7ecb28014b9699a3cf15d1',
	  'amount' => '10.00',
	  'currency' => 'EUR',
	  'paymentType' => 'RF'
	})
	return JSON.parse(http.request(req).body)
end

puts backofficeOperation()