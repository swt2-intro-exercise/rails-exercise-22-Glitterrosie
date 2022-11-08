require 'rails_helper'

describe "paper index page", type: :feature do

    paper = FactoryBot.create :paper

    it "should exist a text saying 'Papers'" do
        visit papers_url
        expect(page).to have_text('Papers')
    end
    
    
    it "should have a link to show a paper" do
        visit papers_url
        expect(page).to have_link 'Show this paper', href: paper_path(paper)
    end

    it "should have a link to add a new paper" do
        visit papers_url
        expect(page).to have_link 'New paper', href: new_paper_path
    end

    it "should have a link to edit a paper" do
        visit papers_url
        expect(page).to have_link 'Edit this paper', href: edit_paper_path(paper)
    end

    it "should have a link to delete a paper" do
        visit papers_url
        expect(page).to have_link 'Delete', href: paper_path(paper)
    end

    it "should have the ability to filter for years" do
        paper1 = FactoryBot.create :paper1
        visit papers_url
        expect(page).to have_link 'Show this paper', href: paper_path(paper)
        expect(page).to have_link 'Show this paper', href: paper_path(paper1)
    end


end