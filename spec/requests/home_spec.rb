require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /" do
    it "ステータスコード200を返すこと" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

end
