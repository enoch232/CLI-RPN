require 'rails_helper'

RSpec.describe CalculatorsController, type: :controller do

  describe 'POST .evaluate' do
    context 'with expression type of RPN' do
      context 'with expression of 5 5 +' do
        before(:each) do
          post :evaluate, format: :json, params: { expression: '5 5 +', expression_type: 'RPN' }
        end

        it 'returns with OK status' do
          expect(response).to have_http_status(200)
        end

        it 'returns with a message with text Successfully calculated' do
          expect(response.body).to include('Successfully calculated')
        end

        it 'returns with a correct result' do
          expect(response.body).to include(10.to_s)
        end
      end
    end

    context 'with empty expression type' do
      context 'with expression of 5 5 +' do
        before(:each) do
          post :evaluate, format: :json, params: { expression: '5 5 +', expression_type: '' }
        end

        it 'returns with status 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns with a message with text Unknown Expression Type' do
          expect(response.body).to include('Unknown Expression Type')
        end

      end
    end

    context 'with no expression type' do
      context 'with expression of 5 5 +' do
        before(:each) do
          post :evaluate, format: :json, params: { expression: '5 5 +' }
        end

        it 'returns with status 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns with a message with text Unknown Expression Type' do
          expect(response.body).to include('Unknown Expression Type')
        end
      end
    end
  end
end
