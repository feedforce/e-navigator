class UsersController < MasterController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]

  private
    define_method("#{controller_name.singularize}_params") {
      sym = controller_name.singularize.to_sym
      params[sym] ? params.require(sym).permit(
          eval(controller_name.singularize.camelize).permit_params
      ) : {}
    }

    def correct_user
      @user = User.find(params[:id])
      unless @user == current_user
        flash[:danger] = '他のユーザー情報は変更できません。'
        redirect_to root_url
      end
    end
end
