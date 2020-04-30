feature "User can login and logout" do
    let(:user) { create(:user) }
 
    describe "on the login the page" do
        before do
            visit new_user_session_path
        end
        
        describe "with correct parameters" do
            before do
                fill_in "Email", with: user.email
                fill_in "Password", with: user.password
                click_on(class: "loginaction")
            end
 
            it "user logs in" do
                expect(page).to have_content "Hello, #{user.name}"
            end

            it "user logs out" do
                click_on "Logout"
                expect(page).to have_content "Signed out successfully."
            end
        end
 
        describe "with wrong password" do
            before do
                fill_in "Email", with: user.email
                fill_in "Password", with: "password124"
                click_on(class: "loginaction")
            end
 
            it "user can't login" do
                expect(page).to have_content "Invalid Email or password"
            end
        end
 
        describe "with wrong email" do
            before do
                fill_in "Email", with: "Donald@potus.com"
                fill_in "Password", with: user.password
                click_on(class: "loginaction")
            end
 
            it "user can't login" do
                expect(page).to have_content "Invalid Email or password"
            end
        end
    end
 end