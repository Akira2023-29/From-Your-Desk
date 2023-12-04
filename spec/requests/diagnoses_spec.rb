require 'rails_helper'

RSpec.describe "Diagnoses", type: :request do
  describe "GET /diagnosis" do
    it "returns http success" do
      get "/diagnoses/diagnosis"
      expect(response).to have_http_status(:success)
    end
  end

end
