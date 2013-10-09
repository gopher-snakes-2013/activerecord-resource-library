require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
  has_many :resources
  validates :name, presence: true
  validates :opinion, presence: true, length: { minimum: 10 }
  attr_accessor :name, :opinion
  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource)
    #self.resources << Resource.create(resource)
  end

end


class Resource < ActiveRecord::Base
  belongs_to :topic
  validates :url, presence: true
  validates :url, format: { with: /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/, multiline: true}
  validates :topic_id, numericality: true
  validates :topic_id, presence: true
  validates :difficulty, inclusion: { in: [:easy, :medium, :hard] }
  attr_accessor :difficulty

end

class TopicTag < ActiveRecord::Base

end

class Tag < ActiveRecord::Base

end
