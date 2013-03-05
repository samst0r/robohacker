require 'open-uri'
require 'json'
require 'net/http'

class ConnectController < ApplicationController
  def index

  	url = getJSON[0]["url"]
  	title = getJSON[0]["title"]


    @link = producePocketURL(url, title)
  	@json = getJSON

  end

  def producePocketURL(url, title)
    link = 'https://getpocket.com/save?url=' << url << '&title=' << title
  end

  def getJSON
  	json = JSON.parse(open("http://apify.heroku.com/api/hacker_news.json").read)

    if (json == null)
      json[0]["url"] = "null"
      json[0]["title"] = "title"
    end if

    puts json
  end

  def oAuth 

  	uri = URI('https://getpocket.com/v3/oauth/request')
  	redirect_uri = URI('https://stormy-ravine-8438.herokuapp.com/connect/index')
	consumer_key = '12115-00e42abdca4960dc82906d1a'
	res = Net::HTTP.post_form(uri, {'redirect_uri' => redirect_uri, 'consumer_key' => consumer_key} )
	puts res.body

  end

end
