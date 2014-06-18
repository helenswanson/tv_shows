require 'rails_helper'


feature 'user views list of characters', %Q{
  As a site visitor
  I want to view a list of people's favorite TV characters
  So I can find wonky characters to watch
} do

  # Acceptance Criteria:
  # * I can see a list of all the characters
  # * The character's name and the TV show it is associated with are listed

  scenario 'user views list of characters with associated tv shows' do
    show = TelevisionShow.create(title: 'Game of Thrones')
    characters = []
    character_attrs = [
      { character_name: 'Arya Stark', actor_name: 'Maisie Williams',
        description: 'Princess of Winterfell', television_show_id: show.id },
      { character_name: 'Sanska Stark', actor_name: 'Sophie Turner',
        description: 'Princess of Winterfell', television_show_id: show.id }
    ]

    character_attrs.each do |attr|
      characters << CharacterShow.create(attr)
    end

    visit '/characters'
    characters.each do |character|
      expect(page).to have_content character.character_name
      expect(page).to have_content character.television_show
    end
  end
end
