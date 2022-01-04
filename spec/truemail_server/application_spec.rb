# frozen_string_literal: true

RSpec.describe TruemailServer::Application do
  describe '.call' do
    subject(:rack_app) { described_class.call(env) }

    let(:env) { {} }
    let(:rack_request_instance) { create_rack_request(**env) }
    let(:controller_response) { %i[a b c] }
    let(:rack_response) { [200, {}, []] }
    let(:rack_response_instance) { create_rack_response(finish: rack_response) }

    it 'successful rack entrypoint' do
      expect(Rack::Request).to receive(:new).with(env).and_return(rack_request_instance)
      expect(TruemailServer::Router).to receive(:call).with(rack_request_instance).and_return(controller_response)
      expect(Rack::Response).to receive(:new).with(*controller_response).and_return(rack_response_instance)
      expect(rack_response_instance).to receive(:finish)
      expect(rack_app).to eq(rack_response)
    end
  end
end
