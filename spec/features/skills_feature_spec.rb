require 'rails_helper'

feature 'Adding skills to a user profile' do

  before do
    visit '/users/sign_up'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'
  end

  context 'when I am on my profile page' do

    scenario 'I can add a learnable' do
      visit '/'
      click_link 'Learn'
      fill_in 'Skill', with: 'Cooking'
      click_button 'Add learnable'
      expect(current_path).to eq '/'
      expect(page).to have_content 'Cooking'
    end

  end

end