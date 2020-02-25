# frozen_string_literal: true

RSpec.describe System::Types do
  shared_examples 'coerces object' do
    it 'coerces object' do
      expect(type.call(initial_object)).to eq(expected_object)
    end
  end

  describe 'StringToRegex' do
    subject(:type) { described_class::StringToRegex }

    let(:initial_object) { '/\A.+\z/' }
    let(:expected_object) { /\A.+\z/ }

    include_examples 'coerces object'
  end

  describe 'StringToArray' do
    subject(:type) { described_class::StringToArray }

    context 'when string without commas' do
      let(:initial_object) { 'some_string' }
      let(:expected_object) { ['some_string'] }

      include_examples 'coerces object'
    end

    context 'when string with commas' do
      let(:initial_object) { 'some_string1,some_string2' }
      let(:expected_object) { %w[some_string1 some_string2] }

      include_examples 'coerces object'
    end
  end

  describe 'StringToHash' do
    subject(:type) { described_class::StringToHash }

    context 'when string without commas' do
      let(:initial_object) { 'key1:value1' }
      let(:expected_object) { { 'key1' => :value1 } }

      include_examples 'coerces object'
    end

    context 'when string with commas' do
      let(:initial_object) { 'key1:value1,key2:value2' }
      let(:expected_object) { { 'key1' => :value1, 'key2' => :value2 } }

      include_examples 'coerces object'
    end
  end
end
