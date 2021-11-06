require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end

  it "should show a field with the name 'author[first_name]' on it" do
    visit new_author_path

    expect(page).to have_field('author[first_name]')
  end
end
