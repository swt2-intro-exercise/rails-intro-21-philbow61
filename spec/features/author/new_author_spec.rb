require 'rails_helper'

describe "New author page", type: :feature do
   it "should exist at 'new_author_path' and render withour error" do
        visit new_author_path
   end
end
