require 'rails_helper'

module Api
  module V1
    module Inspections
      describe PhotosController, type: :controller do

        describe 'POST /api/v1/inspections/:inspection_id/photos' do
          let(:json) { JSON.parse response.body }

          let(:inspection) { ::Inspection.create(description: 'Inspection 001') }

          before do
            post :create, params: { inspection_id: inspection.id, photo_base_64: 'some_hash_64' }
          end

          context 'When given required params' do

            it 'Should create an inspection photo' do
              expect(response.status).to be == 201

              expected_response = {
                'id'            => 11,
                'inspection_id' => 1,
                'photo_url'     => 'http://chid.com/inspection/photo_some_hash_64',
                'caption'       => nil,
              }

              expect(json).to match expected_response
            end
          end
        end
      end
    end
  end
end
