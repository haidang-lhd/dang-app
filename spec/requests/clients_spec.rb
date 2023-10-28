require 'rails_helper'

RSpec.describe 'Clients', type: :request do
  let (:params) { { full_name: 'John Doe' } }
  let (:headers) { { 'Host': 'localhost:3000', 'Content-Type': 'application/json' } }
  let (:request_body) do
    [
      {
        'id': 1,
        'full_name': 'John Doe',
        'email': 'test1@gmail.com'
      },
      {
        'id': 2,
        'full_name': 'Dang Le',
        'email': 'test2@gmail.com'
      }
    ]
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/clients', headers: headers
      expect(response).to have_http_status(:success)
    end

    it 'request with out a body' do
      get '/clients', params: params, headers: headers
      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['clients'].count).to eq(1)
      expect(body['clients'][0]['id']).to eq(1)
      expect(body['clients'][0]['full_name']).to eq('John Doe')
      expect(body['clients'][0]['email']).to eq('john.doe@gmail.com')
    end

    it 'request with a body data' do
      get '/clients', params: params, headers: headers, body: request_body.to_json, as: :json
      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['clients'].count).to eq(1)
      expect(body['clients'][0]['id']).to eq(1)
      expect(body['clients'][0]['full_name']).to eq('John Doe')
      expect(body['clients'][0]['email']).to eq('test1@gmail.com')
    end
  end

  describe 'GET /check_duplicate_mail' do
    it 'returns http success' do
      get '/clients/check_duplicate_mail', headers: headers
      expect(response).to have_http_status(:success)
    end

    it 'request with out a body' do
      get '/clients/check_duplicate_mail', headers: headers
      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['duplicate_mail'].count).to eq(1)
      expect(body['duplicate_mail'][0]['mail']).to eq('jane.smith@gmail.com')
      expect(body['duplicate_mail'][0]['clients'].count).to eq(2)
    end

    # it 'request with a body' do
    #  get '/clients/check_duplicate_mail', headers: headers, body: request_body.to_json, as: :json
    # body = JSON.parse(response.body)
    # expect(response).to have_http_status(:success)
    # expect(body['duplicate_mail']).to eq('No duplicate mails found')
  end
end
