require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  let!(:teacher) { Teacher.create!(full_name: "Sally Carpenter") }
  let!(:course) { Course.create!(title: "Marionette Carpentry", description: "Making marionettes", teacher_id: teacher.id)}

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :course, { id: course.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct course as @course" do
      get :show, { id: course.id }
      expect(assigns(:course)).to eq(course)
    end
  end

  describe "PUT #update" do

    before(:each) do
      put :update, :id => course.id, course: {:title => "Muppet Voice Impressions"}
    end

    it "edits the requested course" do
      expect(course.reload.title).to eq("Muppet Voice Impressions")
    end
  end

  describe "DELETE #destroy" do
    it "responds with status code 302" do
      delete :destroy, {id: course.id}
      expect(response).to have_http_status 302
    end

    it "destroys the requested student" do
      expect { delete(:destory, {id: course.id}) }.to change(Course, :count).by(-1)
    end

    it "redirects to the students list" do
      delete :destroy, { id: course.id }
      expect(response).to redirect_to courses_url
    end
  end

end
