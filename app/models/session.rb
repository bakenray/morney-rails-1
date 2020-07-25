class Session
    include ActiveModel::Model
    attr_accessor :email, :password
    
    validates :email, presence: true #email不能为空
    validates :password, presence: true #password不能为空
    validates_format_of :email,with: /.+@.+/, if: :email  #验证邮箱
    validates :password, length: {minimum:6}, if: :password #密码长度限制
end