require 'rails_helper'

describe "New author page", type: :feature do

  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    visit new_author_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should be an entry in the authors db after submitting a author form" do
    visit new_author_path
    # fill the input fields
    page.fill_in 'author[first_name]', with: 'Ada'
    page.fill_in 'author[last_name]', with: 'Lovelace'
    page.fill_in 'author[homepage]', with: 'https://de.wikipedia.org/wiki/Ada_Lovelace'
    # submitting the form
    page.find('input[type="submit"]').click
  end

end
