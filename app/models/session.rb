class Session
    include ActiveModel::Model
    attr_accessor :email, :password, :user
    
    validates :email, presence: true # email不能为空
    validates :password, presence: true #password不能为空
    validates :password, length: {minimum:6}, if: :password #密码长度限制
    validates_format_of :email,with: /.+@.+/, if: :email  #验证邮箱格式

    validate :check_email, if: :email  #自定义校验，不带s 传有email，就校验email是否存在
    validate :email_password_match, if: Proc.new { |s| s.email.present? and s.password.present?}
    
    def check_email
        user ||=  User.find_by_email email  #也可以写成 User.find_by email: email
        if user.nil? # 判断user为空
            errors.add :email, :not_found
        end
    end

    def email_password_match
        user ||=  User.find_by_email email  #||=缓存复制，先看缓存有没有
        if user and not user.authenticate(password)
            errors.add :password, :mismatch
        end
    end
end