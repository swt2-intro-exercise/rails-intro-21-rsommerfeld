require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render without an error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    visit new_author_path

    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should have a button to create a new author" do
    visit new_author_path
    expect(page).to have_css('input[type="submit"]')
  end

  it "should not throw an error when submitting a filled-out form" do
    # visit the new authors page, fill in the author info and submit
    visit new_author_path
    fill_in "author[first_name]", with: "Alan"
    fill_in "author[last_name]", with: "Turing"
    fill_in "author[homepage]", with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click
  end

  it "should actually create a new author when submitting the form" do
    # expect to not yet find the new author in the db
    author = Author.where(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing").take
    expect(author).to be_nil

    # visit the new authors page, fill in the author info and submit
    visit new_author_path
    fill_in "author[first_name]", with: "Alan"
    fill_in "author[last_name]", with: "Turing"
    fill_in "author[homepage]", with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click

    # expect to find a new author in the db
    author = Author.where(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing").take
    expect(author).not_to be_nil
  end

  it "should show the error text, when no last name is inserted and the user wants to submit" do
    visit new_author_path

    # expect to not see any errors yet
    expect(page).to_not have_text("Last name can't be blank")

    fill_in "author[first_name]", with: "Alan"
    fill_in "author[homepage]", with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click

    # expect to not yet find the new author in the db
    author = Author.where(first_name: "Alan", homepage: "http://wikipedia.org/Alan_Turing").take
    expect(author).to be_nil


    # expect to now see an error printed
    expect(page).to have_text("Last name can't be blank")
  end
end
