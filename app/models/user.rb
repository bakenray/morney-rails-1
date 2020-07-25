class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email # 保证邮箱唯一性
  validates_presence_of :email # 保证邮箱不能为空
  validates_presence_of :password_confirmation, on: [:create] #注册时 密码确认不能为空
  validates_format_of  :email, with: /.+@.+/, if: :email #  emails 判断必须有@符号
  validates :password,length: { minimum:6 }, on: [:create], if: :password   # 密码长度限制
  # 或者可以写成
  # validates_length_of :password, minimum: 6
  after_create :send_welcome_email  # 发送欢迎邮件
  def send_welcome_email
    UserMailer.welcome_email(self).deliver_later 
  end
end


