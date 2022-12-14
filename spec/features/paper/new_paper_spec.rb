require 'rails_helper'

describe "New paper page", type: :feature do

  paper1 = FactoryBot.create :paper1

  it "should exist at 'new_paper_path' and render withour error" do
    visit new_paper_path
  end

  it "should have text inputs for a papers title, venue and style" do
    visit new_paper_path
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end

  it "should be able du submit a form" do
    visit new_paper_path
    # fill the input fields
    page.fill_in 'paper[title]', with: 'Starke Kaffesorten'
    page.fill_in 'paper[venue]', with: 'Berlin'
    page.fill_in 'paper[year]', with: '2022'
    # submitting the form
    page.find('input[type="submit"]').click
  end

  it "should appear an error if the title is blank" do
    visit new_paper_path
    # fill the input fields
    page.fill_in 'paper[title]', with: ''
    page.fill_in 'paper[venue]', with: 'Berlin'
    page.fill_in 'paper[year]', with: '2022'
    # submitting the form
    page.find('input[type="submit"]').click

    expect(page).to have_text("Title can't be blank")
  end

  it "should have an empty list of authors" do
    visit edit_paper_path(paper1)
    expect(paper1.authors).to match_array([])
    
  end

end
