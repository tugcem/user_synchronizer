require 'spec_helper'
require 'rack/test'
require_relative '../app'

RSpec.describe 'User Synchronizer App' do
  include Rack::Test::Methods

  def app
    App.new
  end

  describe "POST /create_user" do
    let(:user) { File.read("spec/fixtures/user.json") }
    before do
      post '/create_user', user
    end
    it "should return status 200" do
      expect(last_response.status).to eq 200
    end

    it "should include specific body" do
      expect(last_response.body).to include 'Syncing user in background:'
    end

    it "should enqueue job to Users::CreateWorker" do
      expect do
        post '/create_user', user
      end.to change(Users::CreateWorker.jobs, :size).by(1)
    end
  end
end
