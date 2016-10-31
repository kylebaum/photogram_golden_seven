class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all

    render("photos/index.html.erb")
  end

  def show
    @id = params["id"]

    @source = Photo.find_by({ :id => @id }).source
    @caption = Photo.find_by({ :id => @id }).caption

    render("photos/show.html.erb")
  end

  def new_form


    render("photos/new_form.html.erb")
  end

  def create_row
    @caption = params["the_caption"].to_s
    @source = params["the_source"].to_s
    create = Photo.new
    create.caption = @caption
    create.source = @source
    create.save

    redirect_to("http://localhost:3000/photos")
  end

  def destroy
    @id = params["id"]

@delete_me = Photo.find_by({ :id => @id })
@delete_me.destroy
  # Photo.find(@id).destroy

    redirect_to("http://localhost:3000/photos")
  end

def edit_form
  @id = params["id"]

  @source = Photo.find_by({ :id => @id }).source
  @caption = Photo.find_by({ :id => @id }).caption

  render("photos/edit_form.html.erb")
end

def update_row
  @id = params["id"]
  @caption = params["the_caption"].to_s
  @source = params["the_source"].to_s
  update = Photo.find_by({ :id => @id })
  update.caption = @caption
  update.source = @source
  update.save

render("photos/show.html.erb")
end

end
