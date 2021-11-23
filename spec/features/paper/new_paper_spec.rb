require 'rails_helper'

describe "New paper page", type: :feature do
    it "should reject a paper with no title" do 
        @paper = Paper.new(title:"")
        expect(@paper).to_not be_valid
    end

    it "should have and belong to many authors" do
        @paper = Paper.new
        expect(@paper.authors).to be_empty
    end
end