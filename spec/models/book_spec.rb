require 'rails_helper'

describe Book do

  before do
    @book= Book.new(name: "Other", price: 9.99, sold: 0, quantity: 8, isbn: "978-596-00681-5")
  end

  subject { @book }

  it { should respond_to(:name) }
  it { should respond_to(:price) }
  it { should respond_to(:quantity) }
  it { should respond_to(:sold) }
  it { should respond_to(:year) }
  it { should respond_to(:isbn) }
  it { should respond_to(:description) }
  it { should respond_to(:authors) }
  it { should respond_to(:genre) }

  it { should be_valid }


  describe "when name is not present" do
    before { @book.name = " " }
    it { should_not be_valid }
  end

  describe "when price is negative" do
    before { @book.price = -8 }
    it { should_not be_valid }
  end

  describe "when quantity is negative" do
    before { @book.quantity = -8 }
    it { should_not be_valid }
  end

  describe "when isbn is already in db" do
    before do
      book_with_same_isbn = @book.dup
      book_with_same_isbn.save
    end

    it { should_not be_valid }
  end

  describe "when ISBN format is invalid" do
    it "should be invalid" do
      isbns = %w[935-596-00681-0  0-5VV-00681-0  978-596-0061-20 ]
      isbns.each do |invalid_isbns|
        @book.isbn = invalid_isbns
        expect(@book).not_to be_valid
      end
    end
  end

  describe "when ISBN format is valid" do
    it "should be valid" do
      isbns = %w[0-596-00681-0  978-596-00681-5]
      isbns.each do |valid_isbns|
        @book.isbn = valid_isbns
        expect(@book).to be_valid
      end
    end
  end


end