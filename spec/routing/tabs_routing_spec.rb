require "rails_helper"

RSpec.describe TabsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tabs").to route_to("tabs#index")
    end

    it "routes to #new" do
      expect(:get => "/tabs/new").to route_to("tabs#new")
    end

    it "routes to #show" do
      expect(:get => "/tabs/1").to route_to("tabs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tabs/1/edit").to route_to("tabs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tabs").to route_to("tabs#create")
    end

    it "routes to #update" do
      expect(:put => "/tabs/1").to route_to("tabs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tabs/1").to route_to("tabs#destroy", :id => "1")
    end

  end
end
