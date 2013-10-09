require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
  validates :name, :opinion, presence: true
  validates :opinion, length: { minimum: 10 }


  has_many :resources
  has_many :topic_tags
  has_many :tags, through: :topic_tags

  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource_attributes)
    resource_attributes[:topic_id] = self.id
    Resource.create!(resource_attributes)
  end
end

class Resource < ActiveRecord::Base
  validates :url, presence: true, format: { with: /http:\/\/.*/, message: "Only valid URL allowed"}
  validates :topic_id, numericality: true, presence: true
  validates :difficulty, inclusion: { in:[:easy, :medium, :hard] }

  belongs_to :topic
end

class TopicTag < ActiveRecord::Base
  belongs_to :topic
  belongs_to :tag
end

class Tag < ActiveRecord::Base
  has_many :topic_tags
  has_many :topics, through: :topic_tags
end
