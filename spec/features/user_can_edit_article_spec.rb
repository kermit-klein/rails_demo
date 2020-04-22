feature "User can edit article" do

    describe "Actually can edit article" do
       before do
            create(:article, title: "Google Hangout Sucks", content: "Yes it does")
            visit root_path
            click_on "Google Hangout Sucks"
            click_on "Edit"
       end

         it "User can edit the content" do
            fill_in "article_content", with: "Discord or Zoom is better"
            click_on "Update"
            expect(page).to have_content "Discord or Zoom is better"
         end
    end
end