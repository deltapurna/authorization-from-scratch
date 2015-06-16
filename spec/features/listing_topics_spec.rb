require 'rails_helper'

feature "ListingTopics", type: :feature do
  it "lists topics as guest" do
    create(:topic, name: "Hello")
    create(:topic, name: "World")
    visit topics_path
    expect(page).to have_content("Hello")
    expect(page).to have_content("World")
  end
end
