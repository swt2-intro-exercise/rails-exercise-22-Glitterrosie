require 'rails_helper'

describe "paper index page", type: :feature do

    paper = FactoryBot.create :paper

    it "should exist a text saying 'Papers'" do
        visit papers_url
        expect(page).to have_text('Papers')
    end
    
    
    it "should have a link to show a paper" do

        #visit new_paper_path

        #page.fill_in 'paper[title]', with: paper[title]
        #page.fill_in 'paper[venue]', with: paper.venue
        #page.fill_in 'paper[year]', with: paper.year

        visit papers_url
        expect(page).to have_link 'Show this paper', href: paper_path(paper)
    end

    it "should have a link to add a new paper" do
        visit papers_url
        #expect(page).to have_button('New paper'), href: new_paper_path

        expect(page).to have_link 'New paper', href: new_paper_path
    end

    it "should have a link to add a new paper" do
        visit papers_url
        expect(page).to have_link 'Edit this paper', href: edit_paper_path(paper)
    end

end