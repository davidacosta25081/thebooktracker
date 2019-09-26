module SessionsHelper


  def log_in(user)
    session[:user_id] = user.id 
  end   


  def logged_in?
    !current_user.nil?
  end


  def current_user
      @current_user ||= User.find_by(id: session[:user_id])
  end

def valid_reg_user(user)
   if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome Back #{user.name.capitalize}"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Invalid email/password combination."
      render :new
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end





end 
