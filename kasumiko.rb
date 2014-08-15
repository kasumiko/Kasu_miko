# encoding: utf-8
require 'twitter'
require 'tweetstream'
require './userconf.rb'

Streamclient = TweetStream::Client.new
Streamclient.userstream do |status|

 username = status.user.screen_name
 contents = status.text
 id = status.id

unless contents =~ /RT/
#namechange
if contents =~ /@Kasu_miko update_name/
 unless contents =~ /(ゆいおぐら).+(連)(ガチャ)/
name = contents.sub(/@Kasu_miko update_name|\s|　/,"")
  if name.length > 20 then
   name = name[0,20]
   @client.update_profile(name: "#{name}")
   @client.update("#{name}に改名しました")
  else
   @client.update_profile(name: "#{name}")
   @client.update("#{name}に改名しました")
  end
  @client.favorite(status)
 end
end

if contents =~ /@Kasu_miko update_profile/
  description = contents.sub(/@Kasu_miko update_profile/,"")
  if description.bytesize > 160 then
   description = description[0,80]
   @client.update_profile(description: "#{description}")
   @client.update("プロフィールを更新しました。"+"\u00A0"*rand(5))
  else
   @client.update_profile(description: "#{description}")
   @client.update("プロフィールを更新しました。")
  end
  @client.favorite(status)
end

if contents =~ /@Kasu_miko update_location/
  location = contents.sub(/@Kasu_miko update_location/,"")
  if location.length > 30 then
   location = name[0,30]
   @client.update_profile(locaton: "#{location}")
   @client.update("今は#{location}にいます")
  else
   @client.update_profile(location: "#{location}")
   @client.update("今は#{location}にいます")
  end
  @client.favorite(status)
end
=begin
if contents =~ /@Kasu_miko update_icon/
  location = contents.gsub(/@Kasu_miko update_location/,"")
  if location.length > 30 then
   location = name[0,30]
   @client.update_profile(locaton: "#{location}")
   @client.update("今は#{location}にいます")
  else
   @client.update_profile(location: "#{location}")
   @client.update("今は#{location}にいます")
  end
  @client.favorite(status)
end
=end
end
end
