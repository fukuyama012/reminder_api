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

    it 'カテゴリ情報を取得できる' do
      json = JSON.parse(response.body)
      expect(json['id']).to eq(@category.id)
      expect(json['name']).to eq(@category.name)
    end
  end

  describe "GET /api/v1/categories" do
    before do
      @category1 = create(:category, id: 1000, name: 'everyday routine')
      @category2 = create(:category, id: 1001, name: 'weekly routine')
      get "/api/v1/categories"
    end

    it '200 OK が返ってくる' do
      expect(response.status).to eq(200)
    end

    it 'カテゴリ一覧情報を取得できる' do
      json = JSON.parse(response.body)
      expect(json[0]['name']).to eq('everyday routine')
      expect(json[1]['name']).to eq('weekly routine')
    end
  end

  describe 'POST /api/v1/categories' do
    let(:path) { '/api/v1/categories' }

    context '1. パラメータが正しいとき' do
      before do
        @params = { category: attributes_for(:category) }
      end

      it '201 Created が返ってくる' do
        post path, params: @params
        expect(response.status).to eq(201)
      end

      it 'Category が 1 増える' do
        expect {
          post path, params: @params
        }.to change(Category, :count).by(1)
      end
    end
  end
end
