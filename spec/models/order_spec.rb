require 'rails_helper'

describe Order do

  before do
     book1=FactoryGirl.create(:book)
     book2=FactoryGirl.create(:book)
    line_item1=LineItem.new(book_id: book1.id)
    line_item2=LineItem.new(book_id: book2.id)
    @order= Order.new(name:'name',address:'address',email:'er@er.rt')
    @order.line_items << line_item1
    @order.line_items << line_item2
  end

  subject { @order }

  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:email) }
  it { should respond_to(:line_items) }

 # describe "when total_price called" do
    #before { @user.login = " " }
 #   its(:total_price) { should eq(20)}
 # end
end