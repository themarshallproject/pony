require "rails_helper"

RSpec.describe EmailsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/emails").to route_to("emails#index")
    end

    it "routes to #new" do
      expect(:get => "/emails/new").to route_to("emails#new")
    end

    it "routes to #show" do
      expect(:get => "/emails/1").to route_to("emails#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/emails/1/edit").to route_to("emails#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/emails").to route_to("emails#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/emails/1").to route_to("emails#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/emails/1").to route_to("emails#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/emails/1").to route_to("emails#destroy", :id => "1")
    end

  end
end
