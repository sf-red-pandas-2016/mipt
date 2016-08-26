require 'rails_helper'

RSpec.describe TeachersController, :type => :controller do

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      response.code.should eq("200")
    end

    # it "renders the :index template" do
    #   get :index
    #   expect(response).to render_template("index")
    # end

  end


  describe "GET #show" do

    # it "responds with status code 200" do
    #   get :show, { id: game.id }
    #   expect(response).to have_http_status 200
    # end

    # it "assigns the correct game as @game" do
    #   get :show, { id: game.id }
    #   expect(assigns(:game)).to eq(game)
    # end

    # it "renders the :show template" do
    #   get :show, { id: game.id }
    #   expect(response).to render_template(:show)
    # end

  end


end