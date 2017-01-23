class StronasController < ApplicationController
 
  layout 'admin'

  def show
    @strona = Strona.find(params[:id])
  end

  def new
    @strona = Strona.new(:name => "Podaj nazwe ")
    @category = Category.order('position ASC')
    @licznik = Strona.count + 1  
  end

  def delete
    @strona = Strona.find(params[:id])
  end

  def remove  
    strona = Strona.find(params[:id]).destroy
    redirect_to(:action=> 'index')
  end

  def edit
    @strona = Strona.find(params[:id])
    @category = Category.order('position ASC')
    @licznik = Strona.count
  end

 def update
    @strona = Strona.find(params[:id])
          if @strona.update_attributes(page_params)
      redirect_to(:action=> 'show', :id => @strona.id)
      else
      @licznik = Strona.count
      @category = Category.order('position ASC')
      render('new')
      end
  end

  def index
    @stronas = Strona.sort
  end

    def create

    @strona = Strona.new(page_params)
      if @strona.save
        flash[:notice] = "Succes!"
      redirect_to(:action=> 'index')
      else
      @licznik = Strona.count + 1
      @category = Category.order('position ASC')
      render('new')
      end
  end

  def page_params
    params.require(:strona).permit(:category_id, :name, :position, :visibility, :created_at)
  end

end
