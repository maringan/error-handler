class Users::Version1 < Users::Base
  version 'v1', using: :path

  resources :users do
    before do
      @user = User.find(params[:id]) if params[:id]
    end

    desc 'List all users'
    get do
      User.all
    end

    desc 'Get user'
    get ':id' do
      User.find(params[:id])
    end

    desc 'Create user'
    post do
      user = User.create!(params[:user])

      status 201
      user
    end

    desc 'Update user'
    put ':id' do
      @user.update_attributes!(params[:user])
      status 204
      ''
    end

    desc 'destroy user'
    delete ':id' do
      @user.destroy
    end
  end
end