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
	  'amount' => '92.12',
	  'currency' => 'EUR',
	  'paymentBrand' => 'KLARNA_INSTALLMENTS',
	  'paymentType' => 'PA',
	  'customer.givenName' => 'Jane',
	  'customer.surname' => 'Jones',
	  'billing.country' => 'SE',
	  'cart.items[0].merchantItemId' => '1',
	  'cart.items[0].discount' => '0.00',
	  'cart.items[0].quantity' => '5',
	  'cart.items[0].name' => 'Product 1',
	  'cart.items[0].price' => '1.00',
	  'cart.items[0].tax' => '6.00',
	  'shopperResultUrl' => 'https://docs.oppwa.com'
	})
	return JSON.parse(http.request(req).body)
end

puts initialPayment()