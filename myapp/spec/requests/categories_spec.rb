require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /api/v1/categories/:id" do
    before do
      @category = create(:category)
      get "/api/v1/categories/#{@category.id}"
    end

    it '200 OK が返ってくる' do
      expect(response.status).to eq(200)
    end

    it '情報を取得できる' do
      json = JSON.parse(response.body)
      expect(json['id']).to eq(@category.id)
      expect(json['name']).to eq(@category.name)
    end
    
  end
end
