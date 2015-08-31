#!/usr/bin/env ruby
require 'net/https'
require 'uri'
require 'json'

def request()
	uri = URI('https://test.oppwa.com/v1/payments')
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	req = Net::HTTP::Post.new(uri.path)
	req.set_form_data({
		'authentication.userId' => '8a8294174b7ecb28014b9699220015cc',
		'authentication.password' => 'sy6KJsT8',
		'authentication.entityId' => '8a8294174b7ecb28014b9699220015ca',
		'amount' => '92.00',
		'currency' => 'EUR',
		'paymentBrand' => 'AMEX',
		'paymentType' => 'PA',
		'card.number' => '377777777777770',
		'card.holder' => 'Jane Jones',
		'card.expiryMonth' => '05',
		'card.expiryYear' => '2018',
		'card.cvv' => '1234'
	})
	res = http.request(req)
	return JSON.parse(res.body)
end

puts request()
