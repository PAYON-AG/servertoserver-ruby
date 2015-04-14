#!/usr/bin/env ruby

require 'net/https'
require 'uri'
require 'json'
 
def initialPayments()
	uri = URI('https://test.oppwa.com/v1/payments')
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	req = Net::HTTP::Post.new(uri.path)
	req.set_form_data({
	  'authentication.userId' => '8a8294174b7ecb28014b9699220015cc',
	  'authentication.password' => 'sy6KJsT8',
	  'authentication.entityId' => '8a8294184c0378fe014c046e80340da9',
	  'amount' => '92.12',
	  'currency' => 'EUR',
	  'paymentBrand' => 'GIROPAY',
	  'paymentType' => 'PA',
	  'bankAccount.bic' => 'TESTDETT421',
	  'bankAccount.iban' => 'DE14940593100000012346',
	  'bankAccount.country' => 'DE',
	  'shopperResultUrl' => 'https://docs.oppwa.com'
	})
	return JSON.parse(http.request(req).body)
end

puts initialPayments()