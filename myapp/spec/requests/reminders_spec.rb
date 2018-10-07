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

  describe 'POST /api/v1/reminders' do
    let(:path) { '/api/v1/reminders' }

    context '1-1. パラメータが正しいとき' do
      before do
        @category = create(:category)
        @params = { reminder: attributes_for(:reminder, category_id: @category.id) }
      end

      it '201 Created が返ってくる' do
        post path, params: @params
        expect(response.status).to eq(201)
      end

      it '同じnotifyを登録しても201 Created が返ってくる' do
        post path, params: @params
        post path, params: @params
        expect(response.status).to eq(201)
      end

      it 'Reminder が 1 増える' do
        expect {
          post path, params: @params
        }.to change(Reminder, :count).by(1)
      end
    end

    context '1-2. notifyが入っていないとき' do
      before do
        @category = create(:category)
        @params = { reminder: attributes_for(:reminder, category_id: @category.id, notify: '') }
      end

      it '422 Unprocessable Entity が返ってくる' do
        post path, params: @params
        expect(response.status).to eq(422)
      end

      it 'Reminderが増減しない' do
        expect {
          post path, params: @params
        }.not_to change(Reminder, :count)
      end
    end

    context '1-3. cycle_days入っていないとき' do
      before do
        @category = create(:category)
        @params = { reminder: attributes_for(:reminder, category_id: @category.id, cycle_days: '') }
      end

      it '422 Unprocessable Entity が返ってくる' do
        post path, params: @params
        expect(response.status).to eq(422)
      end

      it 'Reminderが増減しない' do
        expect {
          post path, params: @params
        }.not_to change(Reminder, :count)
      end
    end

    context '1-4. cycle_daysが整数でないとき' do
      before do
        @category = create(:category)
        @params = { reminder: attributes_for(:reminder, category_id: @category.id, cycle_days: 'a') }
      end

      it '422 Unprocessable Entity が返ってくる' do
        post path, params: @params
        expect(response.status).to eq(422)
      end

      it 'Reminderが増減しない' do
        expect {
          post path, params: @params
        }.not_to change(Reminder, :count)
      end
    end
  end

end
