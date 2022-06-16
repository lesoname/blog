class ArtigosController < ApplicationController
  def index
    @artigos = Artigo.all.page(params[:page])
  end

  def show
    @artigo = Artigo.find(params[:id])
  end

  def new
    @artigo = Artigo.new
  end
  
  #def post creation
  def create
    @artigo = Artigo.new(artigo_params)
    
    if @artigo.save
      redirect_to @artigo

    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def artigo_params
      params.require(:artigo).permit(:title, :contents)
    end

end
