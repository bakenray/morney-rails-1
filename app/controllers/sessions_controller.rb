class SessionsController < ApplicationController
    def create
        s = Session.new create_params
        s.validate # new方法不会触发校验，要手动触发
        render_resource s
        session[:current_user_id] = s.user.id
    end
    def destory
        session[:current_user_id] = nil
        # cookies.delete :_morney_session_id
        head 200
    end
    def create_params
        params.permit(:email, :password)
    end
end
