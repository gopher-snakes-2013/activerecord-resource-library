require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
	has_many :resources
  has_many :topic_tags
	has_many :tags, through: :topic_tags

	validates :name, :opinion, presence: true
	validates :opinion, length: { minimum: 10 }

  def tag_with!(tag)
    TopicTag.create({topic_id: self.id, tag_id: tag.id})
  end

  def add_resource!(resource)
  	resource[:topic_id] = self.id
  	Resource.create(resource)
  end

  def self.tagged_with(tag)
    tag.topics
  end
end

class Resource < ActiveRecord::Base
	belongs_to :topic

	validates :url, :topic_id, presence: true
	validates :url, format: { with: /((http(?:s)?\:\/\/)?[a-zA-Z0-9\-]+(?:\.[a-zA-Z0-9\-]+)*\.[a-zA-Z]{2,6}(?:\/?|(?:\/[\w\-]+)*)(?:\/?|\/\w+\.[a-zA-Z]{2,4}(?:\?[\w]+\=[\w\-]+)?)?(?:\&[\w]+\=[\w\-]+)*)/ }
	validates :difficulty, inclusion: { in: [:easy, :medium, :hard] }
	validates :topic_id, numericality: true

end

class TopicTag < ActiveRecord::Base
	belongs_to :topic
	belongs_to :tag

  validates_uniqueness_of :topic_id, :scope => :tag_id

end

class Tag < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

	has_many :topic_tags
	has_many :topics, through: :topic_tags

end
