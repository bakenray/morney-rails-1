class User < ApplicationRecord
  has_secure_password

  # 保证唯一性
  validates_uniqueness_of :email

  # 设置不能为空
  validates_presence_of :email

  #注册时 密码确认
  validates_presence_of :password_confirmation, on: [:create]

  #  emails 判断必须有@
  validates_format_of  :email, with: /.+@.+/, if: :email

  # 长度限制
  validates :password,length: { minimum:6 }, on: [:create], if: :password

  # 或者可以写成
  # validates_length_of :password, minimum: 6
  
  # 发送欢迎邮件
  after_create :send_welcome_email

  def send_welcome_email
    p 'after xxxxx'
    UserMailer.welcome_email(self).deliver_later 
  end

end


