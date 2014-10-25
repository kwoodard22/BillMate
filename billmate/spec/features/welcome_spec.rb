require 'rails_helper'

feature 'welcome login/signup page' do  
  scenario 'welcomes the user & requires signin' do
    visit '/'
    expect(page.find('h1')).to have_content(/Welcome/)
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Log In")
  end
end

