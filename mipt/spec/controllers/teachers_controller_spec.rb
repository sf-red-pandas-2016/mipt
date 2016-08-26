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

  describe "PUT #update" do

    before(:each) do
      put :update, :id => teacher.id, teacher: {:full_name => "Sarah"}
    end

    it "edits the requested teacher" do
      expect(teacher.reload.full_name).to eq("Sarah")
    end

  end

  describe "DELETE #destroy" do
    it "responds with status code 302" do
      delete :destroy, {id: teacher.id }
      expect(response).to have_http_status 302
    end

    it "destroys the requested teacher" do
      expect { delete(:destroy, { id: teacher.id }) }.to change(Teacher, :count).by(-1)
    end

    it "redirects to the teachers list" do
      delete :destroy, { id: teacher.id }
      expect(response).to redirect_to teachers_url
    end
  end

end
