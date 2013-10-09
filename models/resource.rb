class Resource < ActiveRecord::Base
  belongs_to :topic
  validates :url, :presence => true
  validates :topic_id, :numericality => true
  validates_format_of :url, :with => URI::regexp(%w(http https))

end
