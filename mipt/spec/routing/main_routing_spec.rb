require "rails_helper"

RSpec.describe "Routing to navigation", :type => :routing do

  it "GET / routes to home#index" do
    expect(:get => "/").to route_to("home#index")
  end

    it "routes GET /dashboard to dashboard#index" do
      expect(:get => "/dashboard").to route_to("dashboard#index")
    end

    it "routes GET /teachers to teachers#index" do
      expect(:get => "/teachers").to route_to("teachers#index")
    end

    it "routes GET /students to students#index" do
      expect(:get => "/students").to route_to("students#index")
    end

    it "routes GET /courses to courses#index" do
      expect(:get => "/courses").to route_to("courses#index")
    end

end
