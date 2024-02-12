require 'rails_helper'

RSpec.describe 'Diagnoses', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/diagnoses/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/diagnoses/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/diagnoses/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/diagnoses/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/diagnoses/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/diagnoses/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
