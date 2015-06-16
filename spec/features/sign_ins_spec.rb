require 'rails_helper'

feature "SignIns", type: :feature do
  let(:user) { create(:user) }

  scenario 'Sign in with correct email and password' do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content "Signed in"
  end

  scenario 'Sign in with wrong email/password' do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: 'wrongpassword'
    click_button "Log in"
    expect(page).to have_content "Invalid"
  end
end
