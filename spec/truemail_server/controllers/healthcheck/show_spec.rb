# frozen_string_literal: true

RSpec.describe TruemailServer::Controllers::Healthcheck::Show do
  describe 'inherited from' do
    it { expect(described_class).to be < TruemailServer::Controllers::Base }
  end

  describe '.call' do
    subject(:controller) { described_class.call(params: {}, headers: {}) }

    it do
      expect(controller).to eq([nil, 200, json_content_type])
    end
  end
end
