require 'spec_helper'

# You'll have to write the migrations for this yourself!

# Unit Tests
describe Tag do
  it { should have_many(:topics).through(:topic_tags) }
  describe "#name" do
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name)   }
  end
end

describe Topic do
  it { should have_many(:tags).through(:topic_tags) }
end

describe TopicTag do
  it { should validate_uniqueness_of(:topic_id).scoped_to(:tag_id) }
end

# Integration Tests

describe "Tags and Topics" do
  let(:topic) { Topic.create(random_topic_attributes) }
  let(:tag) { Tag.create(random_tag_attributes) }

  describe "Topic#tag_with" do
    it "adds the tag to the topic" do
      topic.tag_with!(tag)
      expect(TopicTag.where(topic_id: topic.id, tag_id: tag.id)).to exist
    end

    xit "only adds the tag once" do
      topic.tag_with!(tag)
      topic.tag_with!(tag)
      expect(topic.tags.where(tag_id: tag.id).count).to eql 1
    end
  end
end
