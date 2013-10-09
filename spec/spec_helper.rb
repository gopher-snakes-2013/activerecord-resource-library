require './resource_library_app'
require 'shoulda-matchers'
require 'securerandom'
require 'faker'
require 'active_record'
require_relative '../models/resource'
require_relative '../models/topic'

def random_resource_attributes
  {
    url: "http://example.com/#{SecureRandom.hex(6)}",
    difficulty: [:easy, :medium, :hard].sample,
  }
end

def random_topic_attributes
  {
    name: "#{Faker::Name.name}  #{SecureRandom.hex(6)}",
    opinion: Faker::Lorem.paragraph
  }
end

def random_tag_attributes
  {
    name: "#{Faker::Lorem.word} #{SecureRandom.hex(4)}"
  }

end

RSpec.configure do |config|
  config.before do
    Topic.destroy_all
    Resource.destroy_all
    Tag.destroy_all
  end
end
