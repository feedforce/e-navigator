class UsersController < MasterController
  private
    define_method("#{controller_name.singularize}_params") {
      sym = controller_name.singularize.to_sym
      params[sym] ? params.require(sym).permit(
          eval(controller_name.singularize.camelize).permit_params
      ) : {}
    }
end
