# frozen_string_literal: true

RSpec.describe RackHelpers, type: :helper do
  describe '#create_rack_request' do
    subject(:helper) { create_rack_request(**request_data) }

    context 'without args' do
      let(:request_data) { {} }

      it 'returns Rack::Request instance double with default values' do
        expect(helper).to be_an_instance_of(RSpec::Mocks::InstanceVerifyingDouble)
        expect(helper.path).to eq('/')
        expect(helper.params).to eq({})
        expect(helper.env).to eq({})
      end
    end

    context 'with args' do
      let(:request_data) { { path: '/42', params: { a: 1 }, env: { b: 2 } } }

      it 'returns Rack::Request instance double with passed values' do
        expect(helper).to be_an_instance_of(RSpec::Mocks::InstanceVerifyingDouble)
        expect(helper.path).to eq(request_data[:path])
        expect(helper.params).to eq(request_data[:params])
        expect(helper.env).to eq(request_data[:env])
      end
    end
  end

  describe '#create_rack_response' do
    subject(:helper) { create_rack_response(**response_data) }

    context 'without args' do
      let(:response_data) { {} }

      it 'returns Rack::Response instance double with default values' do
        expect(helper).to be_an_instance_of(RSpec::Mocks::InstanceVerifyingDouble)
        expect(helper.finish).to eq([200, {}, []])
      end
    end

    context 'with args' do
      let(:response_data) { { finish: [404, {}, []] } }

      it 'returns Rack::Response instance double with passed values' do
        expect(helper).to be_an_instance_of(RSpec::Mocks::InstanceVerifyingDouble)
        expect(helper.finish).to eq(response_data[:finish])
      end
    end
  end

  describe '#reset_command_line_params!' do
    subject(:helper) { reset_command_line_params! }

    it 'resets command line params' do
      expect(System::Configuration).to receive(:reset_command_line_params!)
      helper
    end
  end

  describe '#reload_rack_cascade!' do
    subject(:helper) { reload_rack_cascade! }

    it 'resets command line params' do
      expect(TruemailServer).to receive(:remove_const).with(:RackCascade).and_call_original
      helper
    end
  end
end
