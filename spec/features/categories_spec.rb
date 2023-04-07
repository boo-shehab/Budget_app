require 'rails_helper'

RSpec.describe 'Food Index', type: :system do
  before(:each) do
    @user = User.create(name: 'anye3', email: 'ahmed200@gmail.com', password: '123456',
                        password_confirmation: '123456')
  end

  it 'Sign up with a user' do
    visit 'users/sign_up'

    sleep(1)
    fill_in 'Name', with: @user.name
    fill_in 'Email', with: @user.email
    sleep(2)
    fill_in 'Password', with: @user.password
    fill_in 'Password confirmation', with: @user.password_confirmation
    click_button 'Sign up'
  end

  it 'User should log in' do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    sleep(2)
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    sleep(2)
    visit new_category_path
    sleep(2)
    fill_in 'Name', with: 'food'
    fill_in 'Icon', with: 'https://png.pngtree.com/element_our/png/20180930/food-icon-design-vector-png_120564.jpg'
    sleep(2)
    click_button 'Submit'
    sleep(2)

    expect(current_path).to eq(root_path)
  end
end
