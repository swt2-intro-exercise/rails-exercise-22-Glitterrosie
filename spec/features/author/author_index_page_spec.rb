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

    it "should have a link to delete authors" do
        # save a new author
        author = FactoryBot.create :author

        visit new_author_path
        page.fill_in 'author[first_name]', with: author.first_name
        page.fill_in 'author[last_name]', with: author.last_name
        page.fill_in 'author[homepage]', with: author.homepage
        # submitting the form
        page.find('input[type="submit"]').click

        visit authors_url
        expect(page).to have_link 'Delete', href: author_path(author)
    end

end