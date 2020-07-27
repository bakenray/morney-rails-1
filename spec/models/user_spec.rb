require 'rails_helper'

RSpec.describe User, type: :model do
  it '创建user' do 
    user = User.create email: 'test@test.com', password:'123456',password_confirmation:'123456'
    expect(user.password_digest).to_not eq '123456'  
    expect(user.id).to be_a Numeric
  end

  it '创建user时email必填' do
    user = User.create  password:'123456',password_confirmation:'123456'
    expect(user.errors.details[:email][0][:error]).to eq(:blank)
  end

  it '创建user时email不能被占用' do
    User.create! email:'test@test.com',password:'123456',password_confirmation:'123456'
    user = User.create email: 'test@test.com', password:'123456',password_confirmation:'123456'
    expect(user.errors.details[:email][0][:error]).to eq(:taken)
  end

  it '创建user成功后发送邮件' do
    mailer = spy('mailer')
    allow(UserMailer).to receive(:welcome_email).and_return(mailer)
    User.create! email:'test@test.com',password:'123456',password_confirmation:'123456'
    expect(UserMailer).to have_received(:welcome_email)
    expect(mailer).to have_received(:deliver_later)
  end

  

end
