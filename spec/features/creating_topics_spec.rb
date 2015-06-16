require 'rails_helper'

feature "CreatingTopics", type: :feature do
  it "creates topic as member" do
    log_in admin: false
    visit topics_path
    click_on "New Topic"
    fill_in "Name", with: "Foobar"
    click_on "Create Topic"
    expect(page).to have_content("successfully created")
    expect(page).to have_content("Foobar")
  end
end
