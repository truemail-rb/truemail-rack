# frozen_string_literal: true

RSpec.describe TruemailServer::Application do
  describe '.call' do
    subject(:rack_app) { described_class.call }

    it { expect(rack_app).to be_nil }
  end
end
