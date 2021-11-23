require 'rails_helper'

describe "author details", type: :feature do
    it "should display all the authors details" do
        
        @alan = FactoryBot.create :author
        visit author_path(@alan)

        expect(page).to have_text( "Alan" )
        expect(page).to have_text( "Turing" )
        expect(page).to have_text( "http://wikipedia.de/Alan_Turing" )
    
    end
end
