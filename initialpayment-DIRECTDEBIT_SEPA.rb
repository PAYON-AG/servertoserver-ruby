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
	  'amount' => '50.00',
	  'currency' => 'EUR',
	  'paymentBrand' => 'DIRECTDEBIT_SEPA',
	  'paymentType' => 'DB',
	  'bankAccount.bic' => 'MARKDEF1100',
	  'bankAccount.iban' => 'DE23100000001234567890',
	  'bankAccount.country' => 'DE',
	  'bankAccount.holder' => 'Jane Jones',
	  'shopperResultUrl' => 'https://docs.oppwa.com'
	})
	return JSON.parse(http.request(req).body)
end

puts initialPayment()