require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
	has_many :resources

	validates :name, :opinion, presence: true
	validates :opinion, length: { minimum: 10 }

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

	validates :url, :topic_id, presence: true
	validates :url, format: { with: /((http(?:s)?\:\/\/)?[a-zA-Z0-9\-]+(?:\.[a-zA-Z0-9\-]+)*\.[a-zA-Z]{2,6}(?:\/?|(?:\/[\w\-]+)*)(?:\/?|\/\w+\.[a-zA-Z]{2,4}(?:\?[\w]+\=[\w\-]+)?)?(?:\&[\w]+\=[\w\-]+)*)/ } 
	validates :difficulty, inclusion: { in: [:easy, :medium, :hard] }
	validates :topic_id, numericality: true

end

class TopicTag < ActiveRecord::Base

end

class Tag < ActiveRecord::Base

end