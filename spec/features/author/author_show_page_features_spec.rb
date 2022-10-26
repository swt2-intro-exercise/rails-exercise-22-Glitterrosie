require 'rails_helper'

describe "author show page", type: :feature do

    author = FactoryBot.create :author
    
    it "should exist at 'author_path(@author)' and render withour error" do
        visit author_path(author)
    end
    
    it "should display the full name and the hompage" do
        visit author_path(author)
        expect(page).to have_text("Name")
        expect(page).to have_text("Homepage")
    end

end