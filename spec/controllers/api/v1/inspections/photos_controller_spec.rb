require 'rails_helper'

module Api
  module V1
    module Inspections
      describe PhotosController, type: :controller do

        describe 'POST /api/v1/inspections/:inspection_id/photos' do

          before do
            post :create, params: { inspection_id: 1 }
          end

          it 'Should create an inspection photo' do
            expect(response.status).to be == 201
          end
        end
      end
    end
  end
end
