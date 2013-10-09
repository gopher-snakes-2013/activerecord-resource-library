require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
  validates :name, :opinion, presence: true
  # validates :opinion, presence: true 
  validates :opinion, length: { minimum: 10 }

  has_many :resources


  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource)
    # IMPLEMENT ME
  end
end

class Resource < ActiveRecord::Base
  belongs_to :topic
  validates :url, format: { with: /(http(?:s)?\:\/\/[a-zA-Z0-9\-]+(?:\.[a-zA-Z0-9\-]+)*\.[a-zA-Z]{2,6}(?:\/?|(?:\/[\w\-]+)*)(?:\/?|\/\w+\.[a-zA-Z]{2,4}(?:\?[\w]+\=[\w\-]+)?)?(?:\&[\w]+\=[\w\-]+)*)/, 
                            message: "Please use a valid url."},
                  presence: true    
  validates :topic_id, numericality: { only_integer: true },
                       presence: true      

end

class TopicTag < ActiveRecord::Base

end

class Tag < ActiveRecord::Base

end
