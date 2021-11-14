require 'rails_helper'

describe "Show authors index page", type: :feature do
  it "should exist at 'authors_path' and render without an error" do
    visit authors_path
  end

  it "should already contain information about a specific existing author" do
    create :author
    visit authors_path

    expect(page).to have_text("Alan Turing")
    expect(page).to have_text("http://wikipedia.de/Alan_Turing")
  end

  it "should have a link to the page to create new authors on" do
    visit authors_path
    expect(page).to have_link "New", href: new_author_path
  end

  it "should have a link to the page of each existing author" do
    author = create :author
    visit authors_path

    expect(page).to have_link "Details", href: author_path(author.id)
  end
end

