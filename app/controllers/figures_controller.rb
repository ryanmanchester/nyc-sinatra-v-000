class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    #binding.pry
    @figure = Figure.find(params[:id])
     erb :'/figures/show'
  end

  post '/figures' do
    @figure = Figure.create(name: params["figure"]["name"])

    if !params[:title]["name"].empty?
    @figure.titles << Title.create(params[:title])
   else
     @figure.title_ids = params[:figure]["title_ids"]
   end

    if !params[:landmark]["name"].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    else
      @figure.landmark_ids = params[:figure]["landmark_ids"]
    end
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(:id)

    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    #binding.pry
  end
end
