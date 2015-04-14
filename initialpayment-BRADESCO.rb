#!/usr/bin/env ruby

require 'net/https'
require 'uri'
require 'json'
 
def initialPayment()
	uri = URI('https://test.oppwa.com/v1/payments')
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	req = Net::HTTP::Post.new(uri.path)
	req.set_form_data({
	  'authentication.userId' => '8a8294174b7ecb28014b9699220015cc',
	  'authentication.password' => 'sy6KJsT8',
	  'authentication.entityId' => '8a8294174b7ecb28014b9699a3cf15d1',
	  'amount' => '1.03',
	  'currency' => 'BRL',
	  'paymentBrand' => 'BRADESCO',
	  'paymentType' => 'PA',
	  'customer.givenName' => 'Braziliano',
	  'customer.surname' => 'Babtiste',
	  'billing.city' => 'Brasilia',
	  'billing.country' => 'BR',
	  'billing.state' => 'DE',
	  'billing.street1' => 'Amazonstda',
	  'billing.postcode' => '12345678',
	  'customParameters[BRADESCO_cpfsacado]' => '11111111111',
	  'shopperResultUrl' => 'https://docs.oppwa.com',
	  'testMode' => 'EXTERNAL'
	})
	return JSON.parse(http.request(req).body)
end

puts initialPayment()