class SessionsController < ApplicationController
    def create
        s = Session.new create_params
        s.validate # new方法不会触发校验，要手动触发
        render_resource s
        # session[:current_user_id] = session.user.id
    end
    def destory
        
    end
    def create_params
        params.permit(:email, :password)
    end
end
