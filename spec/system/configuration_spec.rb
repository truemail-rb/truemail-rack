# frozen_string_literal: true

RSpec.describe System::Configuration do
  describe 'defined constants' do
    it { expect(described_class).to be_const_defined(:INVALID_COMMAND_LINE_PARAMS) }
    it { expect(described_class).to be_const_defined(:COMMAND_LINE_ATTRS) }
  end

  describe 'System::Configuration::Error' do
    subject(:error) { described_class::Error }

    it { expect(error).to be < StandardError }
  end

  describe '.command_line_params' do
    subject(:command_line_params) { described_class.command_line_params }

    context 'when command line params valid' do
      it { expect(command_line_params).to be_an_instance_of(::Hash) }

      it 'depends from actual env vars count' do
        expect(command_line_params.size).to eq(ENV_VARS.size)
      end

      it 'includes env vars as keys' do
        expect(command_line_params.keys).to match_array(ENV_VARS.keys)
      end

      it 'not includes nil values' do
        expect(command_line_params.values).not_to include(nil)
      end

      it 'returns memoized value' do
        expect(command_line_params.object_id).to eq(described_class.command_line_params.object_id)
      end
    end

    context 'when command line params invalid' do
      before do
        reset_command_line_params!
        set_env_vars(verifier_email: nil)
      end

      after { set_env_vars }

      it 'raises System::Configuration::Error' do
        expect { command_line_params }.to raise_error(
          described_class::Error,
          described_class::INVALID_COMMAND_LINE_PARAMS
        )
      end
    end
  end
end
