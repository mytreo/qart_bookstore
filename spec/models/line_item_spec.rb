require 'rails_helper'


describe LineItem do

  before do
    @line_item= LineItem.new

  end

  subject { @line_item }

  it { should respond_to(:book) }
  it { should respond_to(:cart) }
end