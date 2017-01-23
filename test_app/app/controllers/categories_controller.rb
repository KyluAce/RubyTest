class CategoriesController < ApplicationController
  layout 'admin'
  def index
    @categories= Category.sort
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new(:name => "Podaj nazwe ")
    @licznik = Category.count + 1
  end

  def create

    @category = Category.new(category_params)
      if @category.save
        flash[:notice] = "Succes!"
      redirect_to(:action=> 'index')
      else
      @licznik = Category.count + 1
      render('new')
      end
  end

  def edit
    @category = Category.find(params[:id])
    @licznik = Category.count
  end

  def update
    @category = Category.find(params[:id])
          if @category.update_attributes(category_params)
      redirect_to(:action=> 'show', :id => @category.id)
      else
      @licznik = Category.count
      render('edit')
      end
  end



  def delete
    @category = Category.find(params[:id])
  end

  def remove
    category = Category.find(params[:id]).destroy
    redirect_to(:action=> 'index')

  end


def category_params
    params.require(:category).permit(:name, :position, :visibility, :created_at)
  end


end
