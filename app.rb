require './environment'
require_relative "app/models/pirate"
require_relative "app/models/ship"
module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      "Welcome to the Nested Forms Lab! let's navigate to the '/new'"
    end

    get "/new" do
      erb :"pirates/new"
    end

    post '/pirates' do

      @pirate = Pirate.new(params[:pirate])
      @ships = params[:pirate][:ships].map do |details|
        Ship.new(details)
      end
      erb :"pirates/show"
    end
  end
end
