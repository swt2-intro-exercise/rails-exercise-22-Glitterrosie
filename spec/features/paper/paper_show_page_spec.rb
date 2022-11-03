require 'rails_helper'

describe "paper show page", type: :feature do

    paper = FactoryBot.create :paper
    
    it "should exist at 'paper_path(@paper)' and render withour error" do
        visit paper_path(paper)
    end
    
    it "should display title, venue and year" do
        visit paper_path(paper)
        expect(page).to have_text("Title:")
        expect(page).to have_text("Venue:")
        expect(page).to have_text("Year:")
    end

    it "should have links to edit and delete the paper and have a link to go back to all papers" do
        visit paper_path(paper)
        expect(page).to have_link "Edit this paper", href: edit_paper_path(paper)
        #expect(page).to have_button "Destroy this paper", href: paper
        expect(page).to have_button("Destroy this paper")
        expect(page).to have_link "Back to papers", href: papers_path
    end


end