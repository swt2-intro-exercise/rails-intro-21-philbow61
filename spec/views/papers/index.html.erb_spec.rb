require 'rails_helper'

RSpec.describe "papers/index", type: :view do
  before(:each) do
    assign(:papers, [
      Paper.create!(
        title: "Title",
        venue: "Venue",
        year: 2
      ),
      Paper.create!(
        title: "Title",
        venue: "Venue",
        year: 2
      )
    ])
  end

  it "renders a list of papers" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Venue".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end

  it "should allow filtering by year" do 
    example1 = Paper.new(title: "1", venue: "1", year: 1999)
    example1.save
    example2 = Paper.new(title: "2", venue: "2", year: 2000)
    example2.save

    ex1 = Paper.published(1999)

    expect(ex1.include?(example1)).to be true
    expect(ex1.include?(example2)).to be false
  end
end
