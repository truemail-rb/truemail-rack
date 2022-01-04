# frozen_string_literal: true

RSpec.describe TruemailServer::Controllers::Validator::Show do
  describe 'defined constants' do
    it { expect(described_class).to be_const_defined(:ACCESS_ERROR) }
    it { expect(described_class).to be_const_defined(:AUTHORIZATION_HEADER) }
    it { expect(described_class).to be_const_defined(:ATTRIBUTE_ERROR) }
    it { expect(described_class).to be_const_defined(:CONTENT_TYPE) }
  end

  describe 'inherited from' do
    it { expect(described_class).to be < TruemailServer::Controllers::Base }
  end

  describe '.call' do
    subject(:controller) { described_class.call(params:, headers:) }

    let(:params) { { email: } }
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

    context 'when email not found in params' do
      it do
        expect(TruemailServer::Services::AccessToken).to receive(:validate).with(token).and_return(true)
        expect(controller).to eq(
          [
            json_object(error: 'email is required parameter'),
            422,
            json_content_type
          ]
        )
      end
    end

    context 'when access token and email found' do
      let(:email) { 'some_email' }
      let(:object) { json_object(data: 'some_data') }

      it do
        expect(TruemailServer::Services::AccessToken).to receive(:validate).with(token).and_return(true)
        expect(TruemailServer::Services::EmailValidator).to receive(:call).with(email).and_return(object)
        expect(controller).to eq([object, 200, json_content_type])
      end
    end
  end
end
