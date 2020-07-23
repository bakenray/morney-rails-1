class User < ApplicationRecord
  has_secure_password

  # 设置不能为空
  validates_presence_of :email
  validates_presence_of :password_confirmation, on: [create]

  #  emails 判断必须有@
  validates_format_of  :email, with: /.+@.+/
  # 长度限制
  validates :password,length: { minimum:6 }, on: [:create]
  # 或者可以写成
  # validates_length_of :password, minimum: 6
end

