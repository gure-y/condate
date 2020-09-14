module AdminLogInSupport
  def admin_login(user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on("ログインする")
    expect(page).to have_content "メニューを増やす"
  end
end