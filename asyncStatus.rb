#!/usr/bin/env ruby

require 'net/https'
require 'uri'
require 'json'
 
def getPaymentStatus(paymentId)
	path = ("?authentication.userId=8a8294174b7ecb28014b9699220015cc" +
		"&authentication.password=sy6KJsT8" +
		"&authentication.entityId=8a8294174b7ecb28014b9699a3cf15d1")
	
	uri = URI.parse("https://test.oppwa.com/v1/payments/" + paymentId + path)
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	res = http.get(uri.request_uri)
	
	return JSON.parse(res.body)
end

status = getPaymentStatus("8a8294494ce19bdf014ce55532d32b92")
if (status["result"]["code"].start_with?("000"))
	puts "SUCCESS &lt;br/>&lt;br/> Here is the result of your transaction: &lt;br/>&lt;br/>"
	puts status
else
	puts "ERROR &lt;br/>&lt;br/> Here is the result of your transaction: &lt;br/>&lt;br/>"
	puts status
end