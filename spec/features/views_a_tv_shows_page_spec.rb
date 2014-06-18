require 'rails_helper'

feature "user views a TV show's details", %Q{
  As a site visitor
  I want to view the details for a TV show
  So I can find learn more about it
  I can see a the show's title, network, the years it ran, and a synopsis.
} do

  # Acceptance Criteria:
  # * I can see a the show's title, network, the years it ran,
  # and a synopsis.

  scenario "user views a TV show's details" do
    show = TelevisionShow.create(title: 'Game of Thrones',
      network: 'HBO' )

    visit "/television_shows/#{show.id}"

    expect(page).to have_content show.title
    expect(page).to have_content show.network
    expect(page).to have_content show.years
    expect(page).to have_content show.synopsis
  end

  scenario "view character information on tv show page" do
    show = TelevisionShow.create(title: 'Game of Thrones')

    character = Character.create(character_name: 'Arya Stark',
      actor_name: 'Maisie Williams',
      description: 'Princess of Winterfell',
      television_show_id: show.id)


    visit "/television_shows/#{show.id}"

    expect(page).to have_content character.character_name
    expect(page).to have_content character.actor_name
    expect(page).to have_content character.description
  end
end
