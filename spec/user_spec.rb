require 'spec_helper'

describe User do

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_confirmation_of(:password) }
  it { should have_many(:posts) }

  it do
    user = User.create({
    username: "shitty_mapper",
    email: "shitty_mapper@ga.com",
    password: "hello",
    password_confirmation: "hello"
    })
    should validate_uniqueness_of(:username)
    should validate_uniqueness_of(:email)
  end

end
