require 'rails_helper'

describe "New author page", type: :feature do
   it "should exist at 'new_author_path' and render withour error" do
        visit new_author_path
   end

   it "should have text inputs for an author's first name, last name, and homepage" do
      visit new_author_path
         # these are the standard names given to inputs by the Rails form builder
      expect(page).to have_field('author[first_name]')
      expect(page).to have_field('author[last_name]')
      expect(page).to have_field('author[homepage]')
   end

   it "should make a database entry based on the inputs" do
      visit new_author_path

      page.fill_in 'author[first_name]', with: "Alan"
      page.fill_in 'author[last_name]', with: "Turing"
      page.fill_in 'author[homepage]', with: "http://wikipedia.org/Alan_Turing"

      find('input[type="submit"]').click

      expect(Author.where(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing").blank?).to be false

   end

   it "should fail when trying to create an author with no last name" do 
      @author = Author.new(last_name:"")
      expect(@author).to_not be_valid
   end

end 
