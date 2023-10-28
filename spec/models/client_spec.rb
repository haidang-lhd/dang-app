require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'validations' do
    it 'validates presence of first_name' do
      client = build(:client, first_name: nil)
      expect(client).not_to be_valid
      expect(client.errors.messages[:first_name]).to include("can't be blank")
    end

    it 'validates presence of last_name' do
      client = build(:client, last_name: nil)
      expect(client).not_to be_valid
      expect(client.errors.messages[:last_name]).to include("can't be blank")
    end

    it 'validates presence of email' do
      client = build(:client, email: nil)
      expect(client).not_to be_valid
      expect(client.errors.messages[:email]).to include("can't be blank")
    end
  end

  describe 'callbacks' do
    it 'calls #set_full_name before validation' do
      client = build(:client, first_name: 'John', last_name: 'Doe')
      expect(client).to receive(:set_full_name)
      expect(client).to be_valid
      expect(client.full_name).to eq('John Doe')
    end
  end

  describe 'methods' do
    it 'full_name' do
      client = build(:client, first_name: 'John', last_name: 'Doe')
      expect(client.full_name).to eq('John Doe')
    end
  end
end
