require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
  has_many :resources
  validates :name, :opinion, presence: true
  validates :opinion, length: {minimum: 10}
  has_many :tags, through: :topic_tags
  has_many :topic_tags


  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource)
    resource[:topic_id] = self.id
    Resource.create(resource)
  end
end

class Resource < ActiveRecord::Base
  belongs_to :topic
  validates :url, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))
  validates :topic_id, numericality: true
  validates :topic_id, presence: true
  validates_inclusion_of :difficulty, :in => [:easy, :medium, :hard]
end

class TopicTag < ActiveRecord::Base
  validates_uniqueness_of :topic_id, scope: :tag_id
end

class Tag < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, presence: true
  has_many :topics, through: :topic_tags
  has_many :topic_tags
end
