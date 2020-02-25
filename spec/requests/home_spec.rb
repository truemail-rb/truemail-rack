# frozen_string_literal: true

RSpec.describe 'Home', type: :request do
  describe 'GET TruemailServer::Controllers::Validator::Show' do
    let(:params) { '?email=email@true.com' }
    let(:access_token) { 'token' }

    before do
      header('AUTHORIZATION', access_token)
      get("/#{params}")
    end

    describe 'Success' do
      context 'when access token and params passed' do
        it 'renders email validation result' do
          expect(response.body).to match_json_schema('controllers/validator/show')
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

      describe '422 Unprocessable Entity' do
        context 'when required request params not passed' do
          let(:params) { nil }

          it 'renders unprocessable entity error' do
            expect(response.body).to match_json_schema('controllers/error')
            expect(response).to be_unprocessable
          end
        end
      end
    end
  end
end
