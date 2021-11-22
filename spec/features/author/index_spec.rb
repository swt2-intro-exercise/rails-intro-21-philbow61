require 'rails_helper'
describe "index" , type: :feature do
    it "should list all authors with a link to individual author pages and a link to the new author page" do
        @alan = FactoryBot.create :author
    visit authors_url
    expect(page).to have_text("Name")
    expect(page).to have_text("Homepage")
    expect(page).to have_text("Alan Turing")
    expect(page).to have_text("http://wikipedia.de/Alan_Turing")
    expect(page).to have_link "New", href: new_author_path
    end
end
