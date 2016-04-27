require 'rails_helper'

RSpec.describe "Genres pages", type: :request do
  before{
    @genre = FactoryGirl.create(:genre)
  }

  describe "index & show actions" do

    it "visit genre path" do
      get genres_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it "visit concrete genre path valid" do
      get genre_path @genre
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end

  end

end
