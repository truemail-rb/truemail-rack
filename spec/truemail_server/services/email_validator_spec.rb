# frozen_string_literal: true

RSpec.describe TruemailServer::Services::EmailValidator do
  describe '.call' do
    subject(:service) { described_class.call(email) }

    let(:email) { 'some_email_for_validation' }
    let(:truemail_validator_instance) { instance_double('Truemail::Validator') }

    it 'calls truemail message chain' do
      expect(Truemail).to receive(:validate).with(email).and_return(truemail_validator_instance)
      expect(truemail_validator_instance).to receive(:as_json)
      service
    end
  end
end
