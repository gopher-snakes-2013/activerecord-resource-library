require 'spec_helper'

# Unit Tests
describe Topic do
  it { should have_many(:resources) }

  describe '#name' do
    it { should validate_presence_of(:name) }
  end

  describe "#opinion" do
    it { should validate_presence_of(:opinion) }
    it { should_not allow_value("Too short").for(:opinion) }
    it { should allow_value("A well thought out opinion on a subtle and nuanced
                            topic").for(:opinion) }
  end
end

describe Resource do
  it { should belong_to(:topic) }

  describe "#url" do
    it { should allow_value("http://google.com/").for(:url) }
    it { should_not allow_value("an invalid url").for(:url) }
    it { should validate_presence_of(:url) }
  end

  describe "#topic_id" do
    xit { should validate_numericality_of(:topic_id) }
    xit { should validate_presence_of(:topic_id) }
  end

  describe "#difficulty" do
    xit { should ensure_inclusion_of(:difficulty).in_array([:easy, :medium,
                                                          :hard]) }
  end
end

# Integration Tests

describe "Topics and Resources" do
  let(:topic) { Topic.create(random_topic_attributes) }
  describe "#add_resource!" do
    xit "saves the resource to the database in that topic" do
      resource_attributes = random_resource_attributes
      resource = topic.add_resource!(resource_attributes)
      expect(Resource.where(topic_id: topic.id)).to include resource
    end
  end
end
