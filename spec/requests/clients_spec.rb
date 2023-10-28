require 'rails_helper'

RSpec.describe 'Clients', type: :request do
  let (:params) { { full_name: 'John Doe' }.to_json }
  let (:headers) { { 'Host': 'localhost:3000', 'Content-Type': 'application/json' } }
  let (:request_body) do
    {
      '_json': [
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
      ],
      'full_name': 'Dang Le'
    }
  end

  describe 'GET /index' do
    it 'returns http success' do
      post '/clients/filter_clients', headers: headers
      expect(response).to have_http_status(:success)
    end

    it 'request without a body' do
      post '/clients/filter_clients', headers: headers, params: params
      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['clients'].count).to eq(1)
      expect(body['clients'][0]['id']).to eq(1)
      expect(body['clients'][0]['full_name']).to eq('John Doe')
      expect(body['clients'][0]['email']).to eq('john.doe@gmail.com')
    end

    it 'request with a body data' do
      post '/clients/filter_clients', params: request_body.to_json, headers: headers
      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['clients'].count).to eq(1)
      expect(body['clients'][0]['id']).to eq(2)
      expect(body['clients'][0]['full_name']).to eq('Dang Le')
      expect(body['clients'][0]['email']).to eq('test2@gmail.com')
    end
  end

  describe 'GET /check_duplicate_mail' do
    it 'returns http success' do
      post '/clients/check_duplicate_mail', headers: headers
      expect(response).to have_http_status(:success)
    end

    it 'request without a body' do
      post '/clients/check_duplicate_mail', headers: headers
      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['duplicate_mail'].count).to eq(1)
      expect(body['duplicate_mail'][0]['mail']).to eq('jane.smith@gmail.com')
      expect(body['duplicate_mail'][0]['clients'].count).to eq(2)
    end

    it 'request with a body' do
      post '/clients/check_duplicate_mail', headers: headers, params: request_body.except(:full_name).to_json
      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['duplicate_mail']).to eq('No duplicate mails found')
    end
  end
end
