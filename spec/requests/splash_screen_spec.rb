require 'rails_helper'

RSpec.describe 'SplashScreens', type: :request do
  describe 'GET /home' do
    it 'returns http success' do
      get '/splash_screen/home'
      expect(response).to have_http_status(:success)
    end
  end
end
