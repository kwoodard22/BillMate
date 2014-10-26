require 'rails_helper'

feature 'welcome/signup page' do  
  scenario 'welcomes the user & requires signin' do
  
    visit '/'
    expect(page.find('h1')).to have_content(/Welcome/)
    expect(page).to have_content("Sign Up")
    fill_in 'Name', with: 'Jane Doe'
    fill_in 'Email', with: 'janedoe@gmail.com'
    fill_in 'password', with: 'passowrd'
    # fill_in 'password', with: 'password'
    click_on 'Sign Up'

    expect(current_path).to eq(profile_path(User.last.id))
    #expect(find('.notice')).to have_content(/success/i)

  end
end

# feature 'Home Profile page' do  
#   scenario 'redirected to profile page to fill in info' do

#     visit profile_path(User.last.id)

#     fill_in 'Title', with: 'Baby One More Time'
#     fill_in 'Artist', with: 'Britney Spears'
#     fill_in 'Year', with: '1999'
#     click_on 'Create Album'

#     expect(current_path).to eq(album_path(Album.last.id))
#     expect(find('.notice')).to have_content(/success/i)

#   end
# end
