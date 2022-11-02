require 'rails_helper'

describe "New author page", type: :feature do

    author = FactoryBot.create :author

  it "should exist at 'edit_author_path' and render withour error" do
    visit edit_author_path(author)
  end

  it "should have text inputs for an author's first name, last name, and homepage with the right author information" do
    visit edit_author_path(author)

    page.find_field('author[first_name]', with:'Alan')
    page.find_field('author[last_name]', with:'Turing')
    page.find_field('author[homepage]', with:"http://wikipedia.de/Alan_Turing")
  end

  it "after submitting the edited author should be saved" do
    visit edit_author_path(author)
    page.fill_in 'author[last_name]', with: 'Peter'
    page.find('input[type="submit"]').click
    author.reload
    visit edit_author_path(author)
    page.find_field('author[last_name]', with:'Peter')
  end

end