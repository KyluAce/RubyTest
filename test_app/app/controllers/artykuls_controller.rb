class ArtykulsController < ApplicationController
 layout 'admin'

  def index
  @artykuls = Artykul.sort
  end

  def show
    @artykuls = Artykul.find(params[:id])
  end

  def edit
    @artykuls = Artykul.find(params[:id])
    @strona = Strona.order('position ASC')
    @licznik = Artykul.count
  end

  def update
    @artykuls = Artykul.find(params[:id])
    if @artykuls.update_attributes(art_params)
    redirect_to(:action=> 'show', :id => @artykuls.id)
    else
    @licznik = Artykul.count
    @strona = Strona.order('position ASC')
    render('new')
    end
  end

  def new
    @artykuls = Artykul.new({:name => "Title"})
    @strona = Strona.order('position ASC')
    @licznik = Artykul.count + 1
  end


  def create
    @artykuls = Artykul.new(art_params)
      if @artykuls.save
      flash[:notice] = "Succes!"
      redirect_to(:action=> 'index')
      else
      @licznik = Artykul.count + 1
      @strona = Strona.order('position ASC')
      render('new')
      end
  end



  def art_params
    params.require(:artykuls).permit(:strona_id, :name, :position, :images, :visibility, :created_at, :content)
  end



  def delete
    @artykuls = Artykul.find(params[:id])
  end

  def remove
    artykuls = Artykul.find(params[:id]).destroy
          flash[:notice] = "Succes!"
          redirect_to(:action => 'index')
  end
end
