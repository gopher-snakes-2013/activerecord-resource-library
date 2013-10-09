class TopicTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :topic
  validates_uniqueness_of :topic_id, :scope => :tag_id

end
