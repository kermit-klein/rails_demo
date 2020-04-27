require "rails_helper"
feature 'User can see specific article' do
    before do
      create(:article, title: 'A breaking news item', content: 'Some breaking action')      
      visit root_path
      click_on 'A breaking news item'
    end
  
    describe 'Article displays' do
      it 'title' do
        expect(page).to have_content 'A breaking news item'
      end
  
      it 'content' do
        expect(page).to have_content 'Some breaking action'
      end
    
    describe "Not logged in user should not see"
      it 'Edit button' do
        expect(page).to_not have_content 'Edit'
      end
      it 'Delete button' do
        expect(page).to_not have_content 'Delete'
      end
    end
  end