#!/usr/bin/env ruby
require 'net/https'
require 'uri'
require 'json'

def request()
	uri = URI('https://test.oppwa.com/v1/payments/8a82944a4f72f757014f839bf3e8574a')
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	req = Net::HTTP::Post.new(uri.path)
	req.set_form_data({
		'authentication.userId' => '8a8294174b7ecb28014b9699220015cc',
		'authentication.entityId' => '8a8294174b7ecb28014b9699220015ca',
		'authentication.password' => 'sy6KJsT8',
		'amount' => '10.00',
		'currency' => 'EUR',
		'paymentType' => 'CP'
	})
	return JSON.parse(http.request(req).body)
end

puts request()
