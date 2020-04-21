require "rails_helper"
feature "User can create an article" do
    before do
        visit root_path
        click_on "New Article"
    end


    describe "Fill an article" do
       before do
        fill_in "article_title", with: "Sweden won EURO 2021"
        fill_in "article_content", with: "Nahh just kidding!"
        click_on "Save Article"
       end
     
       it 'User should be on article show page' do
        article = Article.find_by(title: 'Sweden won EURO 2021')
        expect(current_path).to eq article_path(article)
       end
       

    end

end