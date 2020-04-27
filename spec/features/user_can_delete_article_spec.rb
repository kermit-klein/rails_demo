feature "User can delete article" do
    # let(:user) { create(:user, username:"avsdf", email:"sdfsdfq@gmail.com") }
    let(:article) {create(:article, title: "Google Hangout Sucks", content: "Yes it does")}
    describe "user goes into article show page" do
        before do   
            login_as(article.user,scope: :user)
            visit root_path
            click_on "Google Hangout Sucks"
        end

        it "clicks delete article" do
            click_on "Delete"
            expect(page).to_not have_content "Google Hangout Sucks"
        end    
    end

end