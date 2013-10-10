class Tag < ActiveRecord::Base
  has_many :topic_tags
  has_many :topics, through: :topic_tags
  validates_uniqueness_of :name
  validates :name, :presence => :true
end
