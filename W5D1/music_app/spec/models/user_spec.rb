require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) {FactoryBot.build(:user, email: "test@test.com", password: "password")}
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_length_of(:password).is_at_least(6)}
    it "should create a session token before validation" do
      user.valid?
      exepect(user.session_token).to_not be_nil
    end
  end

  describe "#reset_session_token!" do
    it "creates new session token" do
      user.valid?
      old_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_token)
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "#is_password?" do
    it "checks that the password matches" do
      expect(user.is_password?("password")).to be true
    end

    it "checks that the passwords do not match" do
      expect(user.is_password?("test")).to be false
    end
  end

  describe "::find_by_credentials" do
    before {user.save!}
    it "finds user when given good credentials" do
      expect(User.find_by_credentials("test@test.com", "password")).to eq(user)
    end

    it "returns nil when given bad credentials" do
      expect(User.find_by_credentials("saflkasdlj", "afdsfadsfsd")).to eq(nil)
    end
  end


end
