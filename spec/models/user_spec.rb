require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'DB table' do
      it { is_expected.to have_db_column :id }
      it { is_expected.to have_db_column :email }
      it { is_expected.to have_db_column :username }
  end

  describe 'Validations' do
      it { is_expected.to validate_presence_of :username }
      it { is_expected.to validate_uniqueness_of :username }
      it { is_expected.to validate_presence_of :email }
      it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe 'factory' do
      it 'has a valid factory' do
          expect(create(:user)).to be_valid
      end
  end
end
