require 'rails_helper'

describe "Show author page", type: :feature do
  it "should exist at 'author_path(:id)' and render without an error" do
    author = create :author
    visit author_path(author.id)
  end
end
