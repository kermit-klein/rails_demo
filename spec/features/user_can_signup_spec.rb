feature 'user can sign up' do
    describe 'user can create an account' do
        before do
            visit new_user_registration_path
            fill_in "Username", with: "Donald"
            fill_in "Email", with: "donald@trump.com"
            fill_in "Password", with: "password123"
            fill_in "Password confirmation", with: "password123"
            click_on(class: "signupaction")
        end
    
        it 'user can fill form and submit' do
            expect(page).to have_content "You have signed up successfully"
        end
    end

    describe 'user gets informative error messages' do
        before do
            visit new_user_registration_path
            fill_in "Email", with: "donald@trump"
            fill_in "Password", with: "password123"
        end

        it 'should give an error no name is given' do
            fill_in "Password confirmation", with: "password123"
            click_on(class: "signupaction")
            expect(page).to have_content "Username can't be blank"
        end

        it 'should give an error if passwords dont match' do
            fill_in "Username", with: "Donald"
            fill_in "Password confirmation", with: "password"
            click_on(class: "signupaction")
            expect(page).to have_content "Password confirmation doesn't match Password"
        end
    end 

    describe "user can't sign up twice" do 
        let(:user) {create(:user)}
        before do 
            visit new_user_registration_path
            fill_in "Username", with: user.username
            fill_in "Email", with: user.email
            fill_in "Password", with: user.password
            fill_in "Password confirmation", with: user.password
            click_on(class: "signupaction")
        end

        it "should give an error when name is taken" do
            expect(page).to have_content "Username has already been taken"
        end
    end
end