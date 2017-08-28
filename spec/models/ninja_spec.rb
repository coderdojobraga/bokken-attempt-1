require "rails_helper"

RSpec.describe Ninja, type: :model do
  before do
    @ninja = FactoryGirl.create :ninja
  end

  subject { @ninja }

  describe "required fields" do
    describe "when name is blank" do
      before { @ninja.name = "" }
      it { should_not be_valid }
    end

    describe "when guardion name is blank" do
      before { @ninja.guardian_name = "" }
      it { should_not be_valid }
    end
  end

  describe "parameter limits" do
    describe "when name is too long" do
      before { @ninja.name = "a" * 76 }
      it { should_not be_valid }
    end

    describe "when guardian name is too long" do
      before { @ninja.guardian_name = "a" * 76 }
      it { should_not be_valid }
    end
  end

  describe "parameter validations" do
    describe "without @ in phone number" do
      before { @ninja.guardian_contact = "abc.123email.com" }
      it { should_not be_valid }
    end
  end
end
