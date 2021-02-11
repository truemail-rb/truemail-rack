# frozen_string_literal: true

RSpec.describe RequestHelpers, type: :helper do
  include described_class

  describe '#app' do
    subject(:helper) { app }

    it { is_expected.to eq(TruemailServer::Application) }
  end
end
