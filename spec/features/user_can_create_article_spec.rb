require "rails_helper"
feature "User can create an article" do
    before do
        visit root_path
        click_on "New Article"
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
       
    end

end