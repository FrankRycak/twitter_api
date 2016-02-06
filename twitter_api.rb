require 'Twitter'
# you have to install the twitter gem. i think its gem install twitter


class TwitterApi


#this method is pretty straight forward. i def an app that would use the chomp to get the twitter handle you wanted to look up. and passed it to the method below. called tweet_long
  def self.get_follower
    puts "Enter Twitter handle, sans @"
    @user_name = gets.chomp
    tweet_long
  end
### so this method below has values that im getting from twitter. count is going to give me back the number of tweets you assign it. in my example i used 20. so it will return 20 of the last tweets the user sent.

### exclude replies is a one of the things twitter lets you access. i set it to true. because I DO, want to filter out the replies. and the next thing i accesed was include_rts which means, i dont want to include retweets. thats why i set it to false.

  def self.tweet_long
    client.user_timeline(@user_name, count: 20, exclude_replies: true, include_rts: false).each { |tweet| print tweet.text, "\n\n "}
  end


# this method is the client. i used it to access twitter app and verify my app. you need to go on twitter register your app with the developer section, it think www.developer.twitter.com im not sure but it should look something like that. they will assign you app a consumer_key and consumer_secret. replace the ? below with the ones you got from tiwtter. and now you have access.

  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key    = "?????????????????????????"
      config.consumer_secret = "??????????????????????????"
    end
  end
end
TwitterApi.get_follower
