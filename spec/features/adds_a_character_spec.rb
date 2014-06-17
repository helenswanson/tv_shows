require 'rails_helper'

feature 'user adds a new character', %Q{
  As a site visitor
  I want to add my favorite TV show characters
  So that other people can enjoy their crazy antics
} do

  # Acceptance Criteria:
  # * I can access a form to add a character on a TV show's page
  # * I must specify the character's name and the actor's name
  # * I can optionally provide a description
  # * If I do not provide the required information, I receive an error message
  # * If the character already exists in the database, I receive an error message

  scenario 'user adds a new character' do

    show = TelevisionShow.create!(title: 'Game of Thrones')

    visit "/television_shows/#{show.id}"
    fill_in 'Character name', with: 'Arya Stark'
    fill_in 'Actor name', with: 'Maisie Williams'
    fill_in 'Description', with: 'Princess of Winterfell'
    click_on 'Submit'

    expect(page).to have_content 'Success'
    expect(page).to have_content 'Arya Stark'
    expect(page).to have_content 'Maisie Williams'
    expect(page).to have_content 'Princess of Winterfell'

  end

end
