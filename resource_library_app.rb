require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
	has_many :resources

	validates :name, :opinion, presence: true
	validates :opinion, exclusion: { in: ["Too short"] }


  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource)
    # IMPLEMENT ME
  end
end

class Resource < ActiveRecord::Base
	belongs_to :topic

	validates :url, :topic_id, presence: true
	validates :url, exclusion: { in: ["an invalid url"] }
	validates :topic_id, numericality: true


end

class TopicTag < ActiveRecord::Base

end

class Tag < ActiveRecord::Base

end
