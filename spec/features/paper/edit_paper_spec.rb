require 'rails_helper'

describe "Show authors index page", type: :feature do
  it "should allow adding a 2nd author" do
    paper = create :paper

    # verify that exactly 1 author exists
    expect(paper.authors.size).to eq(1)


    # create 2nd author
    author = create :author2
    visit edit_paper_path(paper.id)

    # add another author in form
    select = page.find('select')
    select.select author.name

    # submit and verify that authors is now 2 long
    find('input[type="submit"]').click
    paper = Paper.where(id: paper.id).take

    expect(paper.authors.size).to eq(2)
    expect(paper.authors[1].name).to eq('Peter Plagiarist')
  end

end

