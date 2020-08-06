# frozen_string_literal: true

RSpec.describe 'TruemailServer::RackCascade' do
  subject(:rack_cascade) { TruemailServer::RackCascade }

  context 'when LOG_STDOUT false' do
    it { expect(rack_cascade).to eq(TruemailServer::Application) }
  end

  context 'when LOG_STDOUT true' do
    before do
      reset_command_line_params!
      set_env_vars(log_stdout: 'true')
      reload_rack_cascade!
    end

    after do
      reset_command_line_params!
      set_env_vars
      reload_rack_cascade!
    end

    it { expect(rack_cascade).to be_an_instance_of(Rack::CommonLogger) }
  end
end
