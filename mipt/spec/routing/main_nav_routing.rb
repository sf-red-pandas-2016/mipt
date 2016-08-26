require "rails_helper"

RSpec.describe "Routing to navigation", :type => :routing do

  context "when user clicks enter on home index" do
    it "routes GET /dashboard to dashboard#index" do
      expect(:get => "/dashboard").to route_to("dashboard#index")
    end
  end

  context "when user clicks teachers from home dashboard" do
    it "routes GET /teachers to teachers#index" do
      expect(:get => "/teachers").to route_to("teachers#index")
    end
  end

  context "when user clicks students from home dashboard" do
    it "routes GET /students to students#index" do
      expect(:get => "/students").to route_to("students#index")
    end
  end

  context "when user clicks courses from home dashboard" do
    it "routes GET /courses to courses#index" do
      expect(:get => "/courses").to route_to("courses#index")
    end
  end

  context "when user clicks a course from home dashboard" do
    it "routes GET /courses to courses#index" do
      expect(:get => "/courses").to route_to("courses#index")
    end
  end
end
