require 'httparty'

class Recipe
  include HTTParty
  key_value = ENV['FOOD2FORK_KEY'] ||= '3897d5719ececc8c166095731c9b7c2e'
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] ||= 'www.food2fork.com'
    
  base_uri "http://#{hostport}/api/search"
  default_params key: key_value
  format :json

  def self.for term
    get("", query: { q: term })["recipes"]
  end
end
