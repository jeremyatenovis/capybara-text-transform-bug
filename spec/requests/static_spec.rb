require 'rails_helper'

RSpec.describe "Statics", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/static/index"
      expect(response).to have_http_status(:success)
    end
  end

end

RSpec.describe "Statics", type: :system do
  describe 'Index page' do
    it 'shows proper capitalization' do
      visit root_path
      expect(page).to have_content("This Is My Dog's Page!")
    end
  end
end
