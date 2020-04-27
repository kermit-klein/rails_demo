require "rails_helper"
feature "User can create an article" do

   describe "if user is logged in" do
      before do
         visit root_path
         click_on "New Article"        #can also just write   visit new_article_path
      end
      it   "User should see a error" do
         expect(page).to have_content "You need to sign in or sign up before continuing."
      end
   end

   describe "Valid user can create an article" do
      let!(:user) { create(:user) }
      before do
         login_as(user,scope: :user)
         visit root_path
         click_on "New Article"        #can also just write   visit new_article_path
      end

      describe "Fill an article" do
         before do
         fill_in "article_title", with: "Trump won the election"
         fill_in "article_content", with: "Nahh just kidding!"
         click_on "Save"
         end
      
         it  "User should be on the article page" do
               article = Article.find_by(title: "Trump won the election")
               expect(current_path).to eq article_path(article)
         end

         it   "User should see title of article" do
               expect(page).to have_content "Trump won the election"
         end

         it   "User should see title of article" do
               expect(page).to have_content "Nahh just kidding!"
         end

         it "User should see success message" do
         expect(page).to have_content "You did buddy,article posted!"
         end
      end


      describe "User doesn't enter a title for the article [Sad Path]" do
         before do
            fill_in "Content", with: "I don't know Rick"
            click_on "Save"
         end
      
         it 'User should see error message' do
            expect(page).to have_content "Title or content can't be blank"
         end
      end

      describe "User doesn't enter a content for the article [Sad Path]" do
         before do
               fill_in "Title", with: "It looks fake to me"
               click_on "Save"
         end
      
         it 'User should see error message' do
               expect(page).to have_content "Title or content can't be blank"
         end
      end
   end
end