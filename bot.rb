require 'rubygems'
require 'bundler/setup'
require 'twitter'
require 'dotenv'
Dotenv.load

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

File.open("input.txt", "r") do |file|
  input = file.read
  words = input.split(" ")
  wordlist = Hash.new(0)
  words.length.times do |i|
    if words[i + 1] != nil
      wordpair = [words[i], words[i + 1]]
      wordlist[wordpair] += 1
    end
  end
  puts wordlist
end
