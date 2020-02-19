# frozen_string_literal: true

RSpec.describe TruemailServer::Services::AccessToken do
  describe '.validate' do
    subject(:service) { described_class.validate(token) }

    let(:token) { 'some_access_token' }

    context 'when token found' do
      it do
        expect(System::Configuration).to receive(:command_line_params).and_return(access_tokens: [token])
        expect(service).to be(true)
      end
    end

    context 'when token not found' do
      it do
        expect(System::Configuration).to receive(:command_line_params).and_return(access_tokens: [])
        expect(service).to be(false)
      end
    end
  end
end
