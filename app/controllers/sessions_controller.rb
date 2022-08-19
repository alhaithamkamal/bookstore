class SessionsController < ApplicationController
    def new; end
    def create
      admin = Admin.find_by(email: params[:email])
      # finds existing admin, checks to see if admin can be authenticated
      if admin.present? && admin.authenticate(params[:password])
      # sets up admin.id sessions
        session[:admin_id] = admin.id
        redirect_to root_path, notice: 'Logged in successfully'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    end
    def destroy
      # deletes admin session
      session[:admin_id] = nil
      redirect_to root_path, notice: 'Logged Out'
    end
end