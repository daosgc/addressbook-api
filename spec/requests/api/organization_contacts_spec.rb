require 'swagger_helper'

RSpec.describe 'api/organization_contacts', type: :request do

  path '/api/organizations/{organization_id}/contacts' do
    # You'll want to customize the parameter types...
    parameter name: 'organization_id', in: :path, type: :string, description: 'organization_id'

    get('list organization_contacts') do
      response(200, 'successful') do
        let(:organization_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create organization_contact') do
      response(200, 'successful') do
        let(:organization_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/organizations/{organization_id}/contacts/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'organization_id', in: :path, type: :string, description: 'organization_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    patch('update organization_contact') do
      response(200, 'successful') do
        let(:organization_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update organization_contact') do
      response(200, 'successful') do
        let(:organization_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
