require './spec/spec_helper'

describe Users::Version1 do
  def app
    App::Api
  end

  describe 'GET /users' do
    it 'should return all users' do
      get 'api/v1/users'

      last_response.body.should == User.all.to_json
      last_response.status.should == 200
    end
  end

  describe 'POST /users' do
    context 'Valid data' do
      it 'should create user' do
        user_params = { iden: '123', email: '123@123.pl' }
        post 'api/v1/users', user: user_params

        last_response.body.should == User.where(user_params).first.to_json
        last_response.status.should == 201
      end
    end

    context 'Incorrect data' do
      it 'should not create user' do
        post 'api/v1/users', user: { email: '' }

        last_response.body.should == {email: ["can't be blank"]}.to_json
        last_response.status.should == 422
      end
    end
  end

  describe 'Put /users/:id' do
    context 'Valid data' do
      it 'should update user' do
        user = create(:user)
        iden = 'iden'
        put "api/v1/users/#{user.id}", user: { iden: iden }

        last_response.body.should == ''
        last_response.status      == 204
        User.first.iden.should    == iden
      end
    end

    context 'Incorrect data' do
      it 'should not update user' do
        user1 = create(:user)
        user2 = create(:user)

        iden = user1.iden
        put "api/v1/users/#{user2.id}", user: { iden: iden }

        last_response.body.should == {iden: ["has already been taken"]}.to_json
        last_response.status == 422
        User.find(user2.id).iden.should_not == iden
      end
    end
  end

  describe 'DELETE /users/:id' do
    it 'should delete user' do
      user = create(:user)
      delete "/api/v1/users/#{user.id}"

      User.count.should == 0
    end
  end
end