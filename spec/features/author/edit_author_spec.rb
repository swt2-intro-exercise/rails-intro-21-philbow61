require 'rails_helper'

describe 'Edit author page should save changes', type: :feature do
    it "should save changes by changing the database entry" do
        @to_change = FactoryBot.create :author
        visit edit_author_path(@to_change)

        page.fill_in "author[last_name]", with: "Turin"
        find('input[type="submit"]').click

        @to_change.reload
        expect(@to_change.last_name).to eq("Turin")
   
    end
end