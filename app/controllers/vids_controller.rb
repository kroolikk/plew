class VidsController < AdminController


  def index
    @vids = Vid.all
  end


  def show
    @vid = Vid.find(params[:id])
  end


  def new
    @vid = Vid.new
  end


  def edit
    @vid = Vid.find(params[:id])
  end


  def create
    @vid = Vid.new(params[:vid])
    
    if @vid.save
      redirect_to vids_url, notice: 'Video dodane.'
    else
      render action: "new"
    end
  end
  

  def update
    @vid = Vid.find(params[:id])
    
    if @vid.update_attributes(params[:vid])
      redirect_to vids_url, notice: 'Video wyedytowane.'
    else
      render action: "edit"
    end
  end
  
  
  def destroy
    @vid = Vid.find(params[:id])
    @vid.destroy
    
    redirect_to vids_url
  end
end
