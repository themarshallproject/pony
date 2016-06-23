require "rails_helper"

RSpec.describe TemplatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/templates").to route_to("templates#index")
    end

    it "routes to #new" do
      expect(:get => "/templates/new").to route_to("templates#new")
    end

    it "routes to #show" do
      expect(:get => "/templates/1").to route_to("templates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/templates/1/edit").to route_to("templates#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/templates").to route_to("templates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/templates/1").to route_to("templates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/templates/1").to route_to("templates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/templates/1").to route_to("templates#destroy", :id => "1")
    end

  end
end
