# frozen_string_literal: true

RSpec.describe ControllerHelpers, type: :helper do
  describe '#json_object' do
    it { expect(json_object(a: 42)).to match_json_schema('rspec_helpers/json_object') }
  end

  describe '#json_content_type' do
    it { expect(json_content_type).to eq(TruemailServer::Controllers::Base::CONTENT_TYPE) }
  end
end
