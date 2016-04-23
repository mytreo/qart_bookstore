require 'rails_helper'

describe Author do

  before do
    @author= Author.new(name: "Other", description: "Lorem ipsum...")
  end

  subject { @author }

  it { should respond_to(:name) }
  it { should respond_to(:description) }

  it { should be_valid }

  describe "when name is not present" do
    before { @author.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @author.name = "a" * 51 }
    it { should_not be_valid }
  end
end