MyPet::Admin.controllers :settings do
  [:index, :new].each do |action|
    get action do
      @title = pat(:new_title, :model => 'setting')
      @setting = Setting.load
      @setting.id ? redirect(url(:settings, :edit)) : render('settings/new')
    end
  end

  post :create do
    @setting = Setting.new(params[:setting])
    if @setting.save
      @title = pat(:create_title, :model => "setting")
      flash[:success] = pat(:create_success, :model => 'Setting')
      redirect(url(:settings, :edit))
    else
      @title = pat(:create_title, :model => 'setting')
      flash.now[:error] = pat(:create_error, :model => 'setting')
      render 'settings/new'
    end
  end

  get :edit do
    @title = pat(:edit_title, :model => "setting")
    @setting = Setting.load
    if @setting
      render 'settings/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'setting')
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "setting #{params[:id]}")
    @setting = Setting.find(params[:id])
    if @setting
      if @setting.update_attributes(params[:setting])
        flash[:success] = pat(:update_success, :model => 'Setting', :id => "#{params[:id]}")
        redirect(url(:settings, :edit))
      else
        flash.now[:error] = pat(:update_error, :model => 'setting')
        render 'settings/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'setting', :id => "#{params[:id]}")
      halt 404
    end
  end
end # MyPet::Admin.controllers
