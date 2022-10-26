require 'rails_helper'

describe "author index page", type: :feature do

    it "should exist a text saying 'All Authors'" do
        visit authors_url
        expect(page).to have_text('All Authors')
    end
    
    it "should exist a table" do
        visit authors_url
        expect(page).to have_css('table')
    end
    
    it "should have a link to add new authors" do
        visit authors_url
        expect(page).to have_link 'New', href: new_author_path
    end

end