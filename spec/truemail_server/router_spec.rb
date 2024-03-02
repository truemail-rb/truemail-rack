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

      context 'when home resource found in permitted routes' do
        let(:resource) { '/' }
        let(:controller_class) { TruemailServer::Controllers::Validator::Show }

        include_examples 'assigns a route'
      end

      context 'when healthcheck resource found in permitted routes' do
        let(:resource) { '/healthcheck' }
        let(:controller_class) { TruemailServer::Controllers::Healthcheck::Show }

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
        create_rack_request(
          path:,
          params:,
          env: { 'KEY' => 42 }.merge(headers)
        )
      )
    end

    let(:path) { 'path' }
    let(:controller) { ->(request_data) { request_data } }
    let(:params) { { 'a' => 42 } }
    let(:headers) { { 'HTTP_AUTHORIZATION' => 'token' } }

    it 'processes params and proxies request data to controller' do
      expect(described_class::Resolver).to receive(:call).with(path).and_return(controller)
      expect(router).to eq(params: params.transform_keys(&:to_sym), headers:)
    end
  end
end
