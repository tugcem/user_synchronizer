require 'spec_helper'
require 'rack/test'
require_relative '../app'

RSpec.describe 'User Synchronizer App' do
  include Rack::Test::Methods

  def app
    App.new
  end

  describe "POST /create_user" do
    before do
      data = {
        name:   'Faker Fake',
        email:  'faker@fake.com',
        user_id:'99999999'
      }
      post '/create_user', data.to_json
    end
    it "should return status 200" do
      expect(last_response.status).to eq 200
    end

    it "should include specific body" do
      expect(last_response.body).to include 'Syncing user in background:'
    end

    it "should enqueue job to Users::CreateWorker" do
      expect do
        data = {
          name:   'Faker Fake',
          email:  'faker@fake.com',
          user_id:'99999999'
        }
        post '/create_user', data.to_json
      end.to change(Users::CreateWorker.jobs, :size).by(1)
    end
  end
end
