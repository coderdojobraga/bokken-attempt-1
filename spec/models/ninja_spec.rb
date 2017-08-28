require "rails_helper"

RSpec.describe Ninja, type: :model do
  describe "attributes" do
    it "requires a name" do
      ninja = build(:ninja, name: nil)

      expect(ninja).not_to be_valid
    end

    it "requires a guardian name" do
      ninja = build(:ninja, guardian_name: nil)

      expect(ninja).not_to be_valid
    end

    it "requires a guardian contact" do
      ninja = build(:ninja, guardian_contact: nil)

      expect(ninja).not_to be_valid
    end

    it "requires a guardian contact" do
      ninja = build(:ninja, guardian_contact: nil)

      expect(ninja).not_to be_valid
    end

    it "has a maximum character limit in the name" do
      ninja = build(:ninja, name: "a" * 76)

      expect(ninja).not_to be_valid
    end

    it "has a maximum character limit in the guardian name" do
      ninja = build(:ninja, guardian_name: "a" * 76)

      expect(ninja).not_to be_valid
    end
  end
end
