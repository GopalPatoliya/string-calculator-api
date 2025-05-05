require 'rails_helper'

RSpec.describe "Calculations", type: :request do
  describe "POST /calculate" do
    it "returns result for valid input" do
      post "/calculate", params: { input: "1,2,3" }, as: :json
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["result"]).to eq(6)
    end

    it "returns error for negative numbers" do
      post "/calculate", params: { input: "1,-2,-3" }, as: :json
      expect(JSON.parse(response.body)["error"]).to eq("negative numbers not allowed -2,-3")
    end
  end
end
