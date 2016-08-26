require 'rails_helper'

RSpec.describe TeachersController, :type => :controller do

  let!(:teacher) { Teacher.create!(full_name: "Suzan Nosferatu") }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      response.code.should eq("200")
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end

  end


  describe "GET #show" do

#TODO why is this failing?
    it "responds with status code 200" do
      get :teacher, { id: teacher.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct teacher as @teacher" do
      get :show, { id: teacher.id}
      expect(assigns(:teacher)).to eq(teacher)
    end

    it "renders the :show template" do
      get :show, { id: teacher.id }
      expect(response).to render_template(:show)
    end

  end

end
