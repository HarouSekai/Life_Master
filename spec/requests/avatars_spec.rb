require 'rails_helper'

RSpec.describe "Avatars", type: :request do
  describe "GET /edit" do
    it "returns http success" do
      get "/avatars/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
