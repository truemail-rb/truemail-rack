# frozen_string_literal: true

RSpec.describe TruemailServer::Router do
  describe 'Resolver' do
    describe 'defined constants' do
      it { expect(described_class::Resolver).to be_const_defined(:HOME_PATH) }
    end

    describe '.call' do
      subject(:resolver) { described_class::Resolver.call(resource) }

      context 'when home path found' do
        let(:resource) { '/' }

        it { expect(resolver).to be(true) }
      end
    end
  end

  describe '.call' do
    subject(:router) do
      described_class.call(
        create_rack_request(path: path, params: { 'a' => 42 }, env: { 'KEY' => 42, 'HTTP_AUTHORIZATION' => 'token' })
      )
    end

    let(:path) { 'path' }
    let(:controller) { ->(request_data) { request_data } }

    it 'processes params and proxies request data to controller' do
      expect(TruemailServer::Router::Resolver).to receive(:call).with(path).and_return(controller)
      expect(router).to eq(params: { a: 42 }, headers: { 'HTTP_AUTHORIZATION' => 'token' })
    end
  end
end
