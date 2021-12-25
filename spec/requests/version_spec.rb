# frozen_string_literal: true

RSpec.describe 'Version', type: :request do
  describe 'GET TruemailServer::Controllers::Info::Show' do
    let(:access_token) { 'token' }

    before do
      header('AUTHORIZATION', access_token)
      get('/version')
    end

    describe 'Success' do
      context 'when access token passed' do
        it 'renders version result' do
          expect(response.body).to match_json_schema('controllers/version/show')
          expect(response).to be_ok
        end
      end
    end

    describe 'Failure' do
      describe '401 Unauthorized' do
        context 'when access token not found' do
          let(:access_token) { nil }

          it 'renders unauthorized error' do
            expect(response.body).to match_json_schema('controllers/error')
            expect(response).to be_unauthorized
          end
        end
      end
    end
  end
end
