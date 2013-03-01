require 'open-uri'
require 'json'
require 'net/http'

class ConnectController < ApplicationController
  def index

  	@json = getJSON[0]["url"]

  	@oauth_response = oAuth()

  end

  def getJSON
  	JSON.parse(open("http://apify.heroku.com/api/hacker_news.json").read)
  end

  def oAuth 

  	uri = URI('https://getpocket.com/v3/oauth/request')
  	redirect_uri = URI('https://stormy-ravine-8438.herokuapp.com/connect/index')
	consumer_key = '12115-00e42abdca4960dc82906d1a'
	res = Net::HTTP.post_form(uri, {'redirect_uri' => redirect_uri, 'consumer_key' => consumer_key} )
	puts res.body
  end

end
