module AuthMacros
  def log_in(attributes = {})
    @_current_user = create(:user, attributes)
    visit new_user_session_path
    fill_in "Email", with: @_current_user.email
    fill_in "Password", with: @_current_user.password
    click_button "Log in"
    expect(page).to have_content "Signed in"
  end

  def current_user
    @_current_user
  end
end
