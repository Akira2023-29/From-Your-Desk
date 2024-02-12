require 'rails_helper'

RSpec.describe 'ImageAnalyses', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/image_analyses/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/image_analyses/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/image_analyses/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/image_analyses/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/image_analyses/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
