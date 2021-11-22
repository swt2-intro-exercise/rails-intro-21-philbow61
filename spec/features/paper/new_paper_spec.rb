require 'rails_helper'

describe "New paper page", type: :feature do
    it "should reject a paper with no title" do 
        @paper = Paper.new(title:"")
        expect(@paper).to_not be_valid
     end
end