# frozen_string_literal: true

RSpec.describe System::CommandLineParams do
  it { expect(described_class).to be < Dry::Struct }

  describe '.call' do
    subject(:command_line_params) { described_class.call(params) }

    let(:attributes) { System::Configuration::COMMAND_LINE_ATTRS.zip([]).to_h }

    context 'when required params valid' do
      let(:params) { attributes.merge(verifier_email: '', access_tokens: '') }

      it 'returns System::CommandLineParams instance' do
        expect(command_line_params).to be_an_instance_of(described_class)
        expect(command_line_params.to_h.compact).to eq(verifier_email: '', access_tokens: [])
      end
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
