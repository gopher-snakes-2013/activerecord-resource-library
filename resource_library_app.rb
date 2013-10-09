require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
  validates :name, :opinion, presence: true
  validates :opinion, length: { minimum: 10 }

  has_many :resources


  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource)
    # IMPLEMENT ME
    res = Resource.create(resource)
    self.resources.push(res)
    res
    #instantiate a Ressource.new({resource => topic_id =>})
  end
end

class Resource < ActiveRecord::Base
  belongs_to :topic
  validates :url, format: { with: /(http(?:s)?\:\/\/[a-zA-Z0-9\-]+(?:\.[a-zA-Z0-9\-]+)*\.[a-zA-Z]{2,6}(?:\/?|(?:\/[\w\-]+)*)(?:\/?|\/\w+\.[a-zA-Z]{2,4}(?:\?[\w]+\=[\w\-]+)?)?(?:\&[\w]+\=[\w\-]+)*)/, 
                            message: "Please use a valid url."},
                  presence: true    
  validates :topic_id, numericality: { only_integer: true },
                       presence: true
  validates :difficulty, inclusion: { in: [:easy, :medium, :hard] }  

end

class TopicTag < ActiveRecord::Base

end

class Tag < ActiveRecord::Base

end
