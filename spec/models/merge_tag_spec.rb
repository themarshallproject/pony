require 'rails_helper'

RSpec.describe MergeTag, type: :model do

  describe "#recognize" do
    it "can pull out a merge tag" do
      expect(MergeTag.recognize("first *|A_B:1|* last")).to eq ["A_B:1"]
    end

    it "can pull out multiple, different tags" do
      expect(MergeTag.recognize("first *|A|*\n\nand *|B|*")).to eq ["A", "B"]
    end

    it "only shows one tag even if there are multiple occurances" do
      expect(MergeTag.recognize("first *|A|*\n\nand *|A|*")).to eq ["A"]
    end
  end

end
