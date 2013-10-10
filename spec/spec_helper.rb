require './resource_library_app'
require 'shoulda-matchers'
require 'securerandom'
require 'faker'

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
    TopicTag.destroy_all
  end
end
