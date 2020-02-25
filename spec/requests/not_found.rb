# frozen_string_literal: true

RSpec.describe 'Not Found', type: :request do
  describe 'GET TruemailServer::Controllers::Error::Show' do
    before { get('/not_existing_path') }

    describe 'Failure' do
      describe '404 Not Found' do
        context 'when route not found' do
          it 'renders not found error' do
            expect(response.body).to match_json_schema('controllers/error')
            expect(response).to be_not_found
          end
        end
      end
    end
  end
end
