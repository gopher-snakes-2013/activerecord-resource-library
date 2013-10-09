class Resource < ActiveRecord::Base
  belongs_to :topic
  validates :url, :presence => true
  validates :topic_id, :numericality => true, :presence => true
  validates_format_of :url, :with => URI::regexp(%w(http https))
  validates :difficulty, inclusion: { in: [:easy, :medium, :hard] }

end
