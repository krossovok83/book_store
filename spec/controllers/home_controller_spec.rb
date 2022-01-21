# frozen_string_literal: true

RSpec.describe HomeController do
  describe "GET home" do
    it "returns a 200" do
      get :home
      expect(response).to have_http_status(:ok)
    end
    it "render home" do
      get :home
      expect(response).to render_template("home")
    end
  end
end
