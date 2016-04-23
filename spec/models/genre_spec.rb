require 'rails_helper'

describe Genre do

  before do
    @genre = Genre.new(name: "Other")
  end

  subject { @genre }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @genre.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @genre.name = "a" * 31 }
    it { should_not be_valid }
  end
end