require 'rails_helper'

feature "DestroyingTopics", :type => :feature do
  it "destroys topic as admin" do
    create(:topic, name: "Oops")
    log_in admin: true
    visit topics_path
    expect(page).to have_content("Oops")
    click_on "Destroy"
    expect(page).to have_content("successfully destroyed")
    expect(page).to_not have_content("Oops")
  end
end
