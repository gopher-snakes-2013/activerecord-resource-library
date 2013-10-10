describe Topic do
  describe "#tagged_with" do
    let(:topic1) { Topic.create(random_topic_attributes) }
    let(:topic2) { Topic.create(random_topic_attributes) }
    let(:topic3) { Topic.create(random_topic_attributes) }
    let(:topic4) { Topic.create(random_topic_attributes) }

    let(:tag) { Tag.create(random_tag_attributes) }

    before do
      topic1.tag_with!(tag)
      topic3.tag_with!(tag)
    end
    let(:topics) { Topic.tagged_with(tag) }

    it "includes topics tagged with the passed in tag" do
      expect(topics).to include topic1
      expect(topics).to include topic3
    end

    it "does not include topics not tagged with the passed in tag name" do
      expect(topics).not_to include topic2
      expect(topics).not_to include topic4
    end
  end
end
