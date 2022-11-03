require 'rails_helper'

describe "Edit paper page", type: :feature do

    #paper = Paper.new(title: "Bla", venue: "blub", year: 200)
    paper = FactoryBot.create :paper

  it "should exist at 'edit_paper_path' and render withour error" do
    visit edit_paper_path(paper)
  end

  it "should have text inputs for an author's first name, last name, and homepage with the right author information" do
    visit edit_paper_path(paper)

    page.find_field('paper[title]', with: paper.title)
    page.find_field('paper[venue]', with:paper.venue)
    page.find_field('paper[year]', with:paper.year)
  end

  it "after submitting the edited paper should be saved" do
    visit edit_paper_path(paper)
    page.fill_in 'paper[year]', with: '0'
    page.find('input[type="submit"]').click
    paper.reload
    visit edit_paper_path(paper)
    page.find_field('paper[year]', with:'0')
  end

end