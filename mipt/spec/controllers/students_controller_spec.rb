require 'rails_helper'

RSpec.describe StudentsController, :type => :controller do

  let!(:teacher) { Teacher.create!(full_name: "Sally Carpenter") }
  let!(:course) { Course.create!(title: "Marionette Carpentry", description: "Making marionettes", teacher_id: teacher.id)}
  let!(:student) { Student.create!(first_name: "Boris", last_name: "Chaplin", grade_level: 4, gender: "male", gpa: 3.7, number_of_detentions: 568, course_id: course.id, shirt_size: "XS", email: "borischaps@gmail.com", interests: "Marrionettes, Muppets") }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      response.code.should eq("200")
    end

#TODO why is this failing?
    it "renders the :index template" do
      get :index
      expect(reponse).to render_template(:index)
    end
  end

#TODO why is this failing?
  describe "GET #show" do
    it "responds with status code 200" do
      get :student, { id: student.id }
      response.code.should eq("200")
      # expect(response).to have_http_status 200
    end

    it "assigns the correct student as @student" do
      get :show, { id: student.id }
      expect(assigns(:student)).to eq(student)
    end
  end

  describe "PUT #update" do

    before(:each) do
      put :update, :id => student.id, student: {:first_name => "Aaron"}
    end

    it "edits the requested student" do
      expect(student.reload.first_name).to eq("Aaron")
    end
  end

  describe "DELETE #destroy" do
    it "responds with status code 302" do
      delete :destroy, {id: student.id}
      expect(response).to have_http_status 302
    end

    it "destroys the requested student" do
      expect { delete(:destroy, {id: student.id}) }.to change(Student, :count).by(-1)
    end

    it "redirects to the students list" do
      delete :destroy, { id: student.id }
      expect(response).to redirect_to students_url
    end

  end

end
