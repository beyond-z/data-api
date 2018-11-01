require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe InterestsController, type: :controller do
  render_views
  
  let(:user) { create :user, admin: true }

  # This should return the minimal set of attributes required to create a valid
  # Interest. As you add validations to Interest, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { attributes_for(:interest) }

  let(:invalid_attributes) {
    {name: interest.name }
  }
  
  let(:interest) { create :interest }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # IndustriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  
  describe 'when logged in' do
    before do
      sign_in user
    end

    describe "GET #index" do
      it "returns a success response" do
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #new" do
      it "returns a success response" do
        get :new, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        get :edit, params: {id: interest.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Interest" do
          expect {
            post :create, params: {interest: valid_attributes}, session: valid_session
          }.to change(Interest, :count).by(1)
        end

        it "redirects to the interest list" do
          post :create, params: {interest: valid_attributes}, session: valid_session
          expect(response).to redirect_to(interests_path)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {interest: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          { name: 'turtles' }
        }

        it "updates the requested interest" do
          interest = Interest.create! valid_attributes
          put :update, params: {id: interest.to_param, interest: new_attributes}, session: valid_session
          interest.reload
        
          expect(interest.name).to eq('turtles')
        end

        it "redirects to the interest" do
          interest = Interest.create! valid_attributes
          put :update, params: {id: interest.to_param, interest: valid_attributes}, session: valid_session
          expect(response).to redirect_to(interests_path)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          interest = Interest.create! valid_attributes
          put :update, params: {id: interest.to_param, interest: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested interest" do
        interest = Interest.create! valid_attributes
        expect {
          delete :destroy, params: {id: interest.to_param}, session: valid_session
        }.to change(Interest, :count).by(-1)
      end

      it "redirects to the interests list" do
        interest = Interest.create! valid_attributes
        delete :destroy, params: {id: interest.to_param}, session: valid_session
        expect(response).to redirect_to(interests_url)
      end
    end
  end

  describe 'JSON requests' do
    let(:access_token) { create :access_token }
    
    describe "GET #index" do
      it "allows access token via params" do
        get :index, params: {access_key: access_token.key}, session: valid_session, format: :json
        expect(response).to be_successful
      end

      it "allows access token via headers" do
        request.headers.merge!('Access-Key' => access_token.key)
        
        get :index, params: {}, session: valid_session, format: :json
        expect(response).to be_successful
      end
    end
  end
end
