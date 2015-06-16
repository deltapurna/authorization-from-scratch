require 'rails_helper'

feature "UpdatingTopics", :type => :feature do
  it "updates topic as admin" do
    create(:topic, name: "Old Name")
    log_in admin: true
    visit topics_path
    expect(page).to have_content("Old Name")
    click_on "Edit"
    fill_in "Name", with: "New Name"
    click_on "Update Topic"
    expect(page).to have_content("successfully updated")
    expect(page).to have_content("New Name")
    expect(page).to_not have_content("Old Name")
  end

  it 'cannot edit as guest' do
    topic = create(:topic)
    visit edit_topic_path(topic)
    expect(page).to have_content("Not authorized")
  end
end
