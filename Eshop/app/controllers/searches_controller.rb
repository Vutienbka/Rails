class SearchesController < ApplicationController

  def show
    @search = Search.find(params[:id])
  end

  def new
    @search = Search.new
  end

  def edit
    @search = Search.find(params[:id])
  end

  def create
    @search = Search.new(search_params)
    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }

      end
    end
  end

  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was updated successful' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :'searches/new' }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def search_params
    params.require(:search).permit(:keywords, :min_price, :max_price, :manufacturer)
  end
end
