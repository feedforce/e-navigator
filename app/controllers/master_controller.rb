class MasterController < ApplicationController
  def name_singularize
    controller_name.singularize
  end

  def name_pluralize
    controller_name
  end

  def instance_get(sym)     instance_variable_get("@#{sym}"); end
  def instance_set(sym,obj) instance_variable_set("@#{sym}", obj); end

  def _model_() eval(name_singularize.camelize);end

  def index
    objects = _model_.alive_records.page(params[:page]).per(10)
    object_name = name_pluralize
    instance_set(object_name, objects)
  end

  def new
    instance_set(name_singularize,_model_.new)
  end

  def edit
    instance_set(name_singularize,_model_.find_by({id: params[:id]}))
  end

  def show
    instance_set(name_singularize,_model_.find_by({id: params[:id]}))
  end

  def create
    obj = instance_set(name_singularize,_model_.new(__send__("#{name_singularize}_params")))
    if obj.save
      if obj.class == User
        log_in(obj)
      end
      flash[:success] = "登録いたしました"
      redirect_to __send__("#{name_pluralize}_path")
    else
      flash.now[:danger] = "登録に失敗しました"
      render action: :new
    end
  end

  def update
    obj = instance_set(name_singularize,_model_.find_by({id: params[:id]}))
    p "================"
    p obj.class == User
    if obj.update_attributes(__send__("#{name_singularize}_params"))
      flash[:success] = "更新いたしました"
      redirect_to __send__("#{name_pluralize}_path",obj)
    else
      flash.now[:danger] = "更新に失敗しました"
      render :action=>:edit
    end
  end

  def destroy
    obj = instance_set(name_singularize,_model_.find_by({id: params[:id]}))
    if obj.class == User
      session[:user_id] = nil
      flash[:success] = "削除いたしました"
      obj.all_destroy
      redirect_to root_url
    else
      flash[:success] = "削除いたしました"
      obj.all_destroy
      redirect_to __send__("#{name_pluralize}_path")
    end
  end
end
