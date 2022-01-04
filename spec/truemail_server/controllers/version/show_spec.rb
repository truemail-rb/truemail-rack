# frozen_string_literal: true

RSpec.describe TruemailServer::Controllers::Version::Show do
  describe 'inherited from' do
    it { expect(described_class).to be < TruemailServer::Controllers::Base }
  end

  describe '.call' do
    subject(:controller) { described_class.call(params: {}, headers:) }

    let(:email) { nil }
    let(:headers) { { TruemailServer::Controllers::Base::AUTHORIZATION_HEADER => token } }
    let(:token) { 'some_access_token' }

    context 'when access token not found in headers or invalid' do
      it do
        expect(TruemailServer::Services::AccessToken).to receive(:validate).with(token).and_return(false)
        expect(controller).to eq(
          [
            json_object(error: 'invalid truemail access token'),
            401,
            json_content_type
          ]
        )
      end
    end

    context 'when valid access token' do
      let(:email) { 'some_email' }
      let(:object) { json_object('some json object') }

      it do
        expect(TruemailServer::Services::AccessToken).to receive(:validate).with(token).and_return(true)
        expect(TruemailServer::Services::Environment).to receive(:call).and_return(object)
        expect(controller).to eq([object, 200, json_content_type])
      end
    end
  end
end
