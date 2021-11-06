require 'rails_helper'

describe Author, type: :model do
  it "should have a constructor that can be called without an error" do
    expect(Author.new).to be_valid
  end

  it "should should correctly set attributes during instance creation" do

  end
end