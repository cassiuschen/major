require 'rails_helper'

RSpec.describe RegisterController, type: :controller do

  describe "GET #student" do
    it "returns http success" do
      get :student
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #stuff" do
    it "returns http success" do
      get :stuff
      expect(response).to have_http_status(:success)
    end
  end

end
