# frozen_string_literal: true

RSpec.describe TruemailServer::Controllers::Error::Show do
  describe 'defined constants' do
    it { expect(described_class).to be_const_defined(:NOT_FOUND) }
  end

  describe 'inherited from' do
    it { expect(described_class).to be < TruemailServer::Controllers::Base }
  end

  describe '.call' do
    subject(:controller) { described_class.call(params: {}, headers: {}) }

    it do
      expect(controller).to eq(
        [
          json_object(error: 'resource not found'),
          404,
          json_content_type
        ]
      )
    end
  end
end
