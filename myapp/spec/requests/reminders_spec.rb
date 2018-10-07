require 'rails_helper'

RSpec.describe "Reminders", type: :request do
  describe "GET /api/v1/reminders/:id" do
    before do
      @reminder = create(:reminder)
      get "/api/v1/reminders/#{@reminder.id}"
    end

    it '200 OK が返ってくる' do
      expect(response.status).to eq(200)
    end

    it 'カテゴリ情報を取得できる' do
      json = JSON.parse(response.body)
      expect(json['id']).to eq(@reminder.id)
      expect(json['notify']).to eq(@reminder.notify)
      expect(json['description']).to eq(@reminder.description)
      expect(json['cycle_days']).to eq(@reminder.cycle_days)
      expect(json['category_id']).to eq(@reminder.category_id)
    end
  end
  
  describe "GET /api/v1/reminders" do
    before do
      @reminder1 = create(:reminder, id: 1000, notify: 'Wake up!')
      @reminder2 = create(:reminder, id: 1001, notify: 'Sleep now!!')
      get "/api/v1/reminders"
    end

    it '200 OK が返ってくる' do
      expect(response.status).to eq(200)
    end

    it 'リマインダー一覧情報を取得できる' do
      json = JSON.parse(response.body)
      expect(json[0]['notify']).to eq('Wake up!')
      expect(json[1]['notify']).to eq('Sleep now!!')
    end
  end 
end
