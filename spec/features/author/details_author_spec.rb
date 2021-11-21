require 'rails_helper'

describe "author details", type: :feature do
    it "should display all the authors details" do
        visit new_author_path

        page.fill_in 'author[first_name]', with: "Alan"
        page.fill_in 'author[last_name]', with: "Turing"
        page.fill_in 'author[homepage]', with: "http://wikipedia.org/Alan_Turing"

        find('input[type="submit"]').click

        expect(page).to have_text( "Alan" )
        expect(page).to have_text( "Turing" )
        expect(page).to have_text( "http://wikipedia.org/Alan_Turing" )
    
    end
end
