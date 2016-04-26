require 'rails_helper'

describe Cart do

  before do
    @cart= Cart.new()
  end

  subject { @cart }

  it { should respond_to(:line_items) }

end






