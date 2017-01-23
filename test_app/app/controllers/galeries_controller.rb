class GaleriesController < ApplicationController
 
 layout 'admin'
  def index
    @galery = Galery.sort
  end

  def new
    @galery = Galery.new({:name=> "Nazwa"})
    @licznik = Galery.count + 1
  end

  def create
    @galery = Galery.new(galery_params)
    if @galery.save
      flash[:notice] = "Success"
      redirect_to(:action => 'index') 
    else
      @licznik = Galery.count +1
      render('new')

    end
  end

  def galery_params
    params.require(:galery).permit(:name, :position, :pictures, :visibility, :created_at, :content)
  end


  def show
  end

  def delete
  end

  def edit
  end


end
