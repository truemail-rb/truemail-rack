# frozen_string_literal: true

RSpec.describe TruemailServer::Services::Environment do
  describe '.call' do
    subject(:service) { described_class.call }

    let(:core) { 'core version' }
    let(:platform) { `ruby -v`.chomp }
    let(:version) { 'server version' }

    before do
      stub_const('Truemail::VERSION', core)
      stub_const('TruemailServer::VERSION', version)
    end

    it 'returns json with data about current environment' do
      expect(service).to eq({ core:, platform:, version: }.to_json)
    end
  end
end
