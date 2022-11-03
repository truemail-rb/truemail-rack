# frozen_string_literal: true

RSpec.describe System::CommandLineParams do
  it { expect(described_class).to be < Dry::Struct }

  describe '.call' do
    subject(:command_line_params) { described_class.call(params) }

    let(:attributes) { System::Configuration::COMMAND_LINE_ATTRS.zip([]).to_h }

    shared_examples 'returns System::CommandLineParams instance' do
      it 'returns System::CommandLineParams instance' do
        expect(command_line_params).to be_an_instance_of(described_class)
        expect(command_line_params.to_h.compact).to eq(expectation)
      end
    end

    context 'when required params valid' do
      let(:params) { attributes.merge(verifier_email: '', access_tokens: '') }
      let(:expectation) { { verifier_email: '', access_tokens: [] } }

      include_examples 'returns System::CommandLineParams instance'
    end

    context 'when all params valid' do
      let(:params) do
        {
          verifier_email: '',
          verifier_domain: '',
          email_pattern: '/regex/',
          smtp_error_body_pattern: '/regex/',
          connection_timeout: '1',
          response_timeout: '2',
          connection_attempts: '3',
          default_validation_type: 'a',
          validation_type_for: 'a:b',
          whitelisted_emails: '',
          blacklisted_emails: '',
          whitelisted_domains: '',
          blacklisted_domains: '',
          whitelist_validation: 'true',
          blacklisted_mx_ip_addresses: '',
          dns: '',
          not_rfc_mx_lookup_flow: 'false',
          smtp_port: '2525',
          smtp_fail_fast: 'false',
          smtp_safe_check: 'false',
          access_tokens: '1,2',
          log_stdout: 'true'
        }
      end
      let(:expectation) do
        {
          verifier_email: '',
          verifier_domain: '',
          email_pattern: /regex/,
          smtp_error_body_pattern: /regex/,
          connection_timeout: 1,
          response_timeout: 2,
          connection_attempts: 3,
          default_validation_type: :a,
          validation_type_for: { 'a' => :b },
          whitelisted_emails: [],
          blacklisted_emails: [],
          whitelisted_domains: [],
          blacklisted_domains: [],
          whitelist_validation: true,
          blacklisted_mx_ip_addresses: [],
          dns: [],
          not_rfc_mx_lookup_flow: false,
          smtp_port: 2525,
          smtp_fail_fast: false,
          smtp_safe_check: false,
          access_tokens: %w[1 2],
          log_stdout: true
        }
      end

      include_examples 'returns System::CommandLineParams instance'
    end

    shared_examples 'raises error' do
      it { expect { command_line_params }.to raise_error(Dry::Struct::Error) }
    end

    context 'when required params nil' do
      let(:params) { attributes }

      include_examples 'raises error'
    end

    context 'when params invalid' do
      let(:params) { attributes.merge(verifier_email: '', access_tokens: '', validation_type_for: '1,2') }

      include_examples 'raises error'
    end
  end
end
