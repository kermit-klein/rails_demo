feature "User can edit article" do
   # let!(:user) { create(:user) }
   let(:article) {create(:article, title: "Google Hangout Sucks", content: "Yes it does")}
    describe "Actually can edit article" do
       before do
            login_as(article.user,scope: :user)
            # create(:article, title: "Google Hangout Sucks", content: "Yes it does")
            visit root_path
            click_on "Google Hangout Sucks"
            click_on "Edit"
       end

         it "User can edit the content" do
            fill_in "Content", with: "Discord or Zoom is better"
            click_on "Save Edit"
            expect(page).to have_content "Discord or Zoom is better"
         end
    end
end