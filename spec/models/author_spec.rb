require 'rails_helper'

RSpec.describe Author, type: :model do

    

    it "should exist with a first and last name and a homepage" do

        author = Author.new()
        author.first_name = 'Alan'
        author.last_name = 'Turing'
        author.homepage = 'http://wikipedia.org/Alan_Turing'

        expect(author.first_name).to eq('Alan')
        expect(author.last_name).to eq('Turing')
        expect(author.homepage).to eq('http://wikipedia.org/Alan_Turing')
        expect(author.name()).to eq('Alan Turing')
    end

    

    it "shouldn't have an empty string as a last name" do
        nonValidAuthor = Author.new()
        expect(nonValidAuthor).to_not be_valid
      end
end
