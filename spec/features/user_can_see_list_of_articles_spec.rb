# spec/features/user_can_see_list_of_articles_spec.rb
require "rails_helper"
# let(:user1) {create(:user)}
feature 'List articles on index page' do
  context 'with articles in db' do
    before do
      # create(:article, title: 'A breaking news item',user: :user1 )
      # create(:article, title: 'Learn Rails 5', user: :user1)
      create(:article, title: 'Learn Rails 5')
      create(:article, title: 'A breaking news item')
      visit root_path
    end
    
    it 'displays first article title' do
      expect(page).to have_content 'A breaking news item'
    end
    
    it 'displays second article title' do
      expect(page).to have_content 'Learn Rails 5'
    end
  end
end