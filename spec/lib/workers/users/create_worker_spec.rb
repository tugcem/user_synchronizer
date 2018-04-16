require 'spec_helper'
# require_relative 'lib/operations/users/create'

RSpec.describe 'Users::CreateWorker' do
  describe "perform" do
    let(:user) { JSON.parse(File.read("spec/fixtures/user.json")) }

    it "call User Create operation" do
      expect(Users::Create).to receive(:new).with(user)
      Users::CreateWorker.new.perform(user)
    end
  end
end
