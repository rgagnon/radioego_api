require 'spec_helper'

describe AudiosController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', :format => :json
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => 1234, :format => :json
      response.should be_success
    end
  end

end
