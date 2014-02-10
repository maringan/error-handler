class Users::Version1 < Users::Base
  version 'v1', using: :path

  resources :users do
    before do
      authenticate!
      @user = User.find(params[:id]) if params[:id]
    end

    desc 'List all users'
    get do
      User.all
    end

    desc 'Get user'
    params do
      requires :id, type: Integer, desc: 'User ID'
    end
    get ':id' do
      User.find(params[:id])
    end

    desc 'Create user'
    params do
      requires :user, type: Hash, desc: 'User params'
    end
    post do
      user = User.create!(params[:user])

      status 201
      user
    end

    desc 'Update user'
    params do
      requires :id, type: Integer, desc: 'User ID'
      requires :user, type: Hash, desc: 'User params'
    end
    put ':id' do
      @user.update_attributes!(params[:user])

      status 204
      ''
    end

    desc 'destroy user'
    params do
      requires :id, type: Integer, desc: 'User ID'
    end
    delete ':id' do
      @user.destroy
    end
  end
end