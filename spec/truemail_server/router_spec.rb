# frozen_string_literal: true

RSpec.describe TruemailServer::Router do
  describe 'Resolver' do
    describe '.call' do
      subject(:resolver) { described_class::Resolver.call(resource) }

      shared_examples 'assigns a route' do
        it 'returns corresponding controller class' do
          expect(resolver).to eq(controller_class)
        end
      end

      context 'when resource found in permitted routes' do
        let(:resource) { '/' }
        let(:controller_class) { TruemailServer::Controllers::Validator::Show }

        include_examples 'assigns a route'
      end

      context 'when resource not found in permitted routes' do
        let(:resource) { '/not_existing_resource' }
        let(:controller_class) { TruemailServer::Controllers::Error::Show }

        include_examples 'assigns a route'
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
