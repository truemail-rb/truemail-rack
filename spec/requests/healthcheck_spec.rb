# frozen_string_literal: true

RSpec.describe 'Healthcheck', type: :request do
  describe 'GET TruemailServer::Controllers::Healthcheck::Show' do
    before { get('/healthcheck') }

    describe 'Success' do
      describe '200 Ok' do
        it 'returns 200 status with empty body' do
          expect(response.body).to be_empty
          expect(response).to be_ok
        end
      end
    end
  end
end
