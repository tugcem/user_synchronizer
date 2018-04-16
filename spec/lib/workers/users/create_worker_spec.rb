require 'spec_helper'

RSpec.describe 'Users::CreateWorker' do
  describe "perform" do
    let(:user) { JSON.parse(File.read("spec/fixtures/user.json")) }

    it 'should call User Create operation' do
      stub_const('ENV', {'INTERCOM_ACCESS_TOKEN' => 'aj7ety7b'})
      expect(Users::Create).to receive(:new).with(user)
      Users::CreateWorker.new.perform(user)
    end
  end
end
