require 'rails_helper'

describe Author, type: :model do
  it "should have a constructor that can create author instances" do
    author = Author.new
    expect(author).to be_an_instance_of(Author)
  end

  it "should should correctly set attributes during instance creation" do
    first_name = "Alan"
    last_name = "Turing"
    homepage = 'http://wikipedia.org/Alan_Turing'
    author = Author.new(first_name: first_name, last_name: last_name, homepage: homepage)

    expect(author.first_name).to eq(first_name)
    expect(author.last_name).to eq(last_name)
    expect(author.homepage).to eq(homepage)
  end

  it "should offer a method to get the full name" do
    author = build :author
    expect(author.name).to eq("Alan Turing")
  end

  it "should not be valid without a last name" do
    author = build :author
    author.last_name = ""

    expect(author).to_not be_valid
  end
end