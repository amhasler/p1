class MediaObjectsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
	# GET /works/new
  def new
    @media_object = MediaObject.new
    @work = Work.find(params[:work_id])
  end

	def create
    @media_object = MediaObject.new(media_object_params)
    @work = Work.find(media_object_params[:work_id])

    respond_to do |format|
      if @media_object.save
        format.html { redirect_to edit_work_path(@work), notice: 'Media object was successfully created.' }
        format.json { render :show, status: :created, location: @media_object }
      else
        format.html { render :new }
        format.json { render json: @media_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /works/1/edit
  def edit
  	@media_object = MediaObject.find(params[:id])
  	@work = Work.find(params[:work_id])

  end

  def update
  	@media_object = MediaObject.find(params[:id])
  	@work = @media_object.work

  	respond_to do |format|
      if @media_object.update(media_object_params)
        format.html { redirect_to edit_work_path(@work), notice: 'Media object was successfully updated.' }
        format.json { render :show, status: :ok, location: @work }
      else
        format.html { render :edit }
        format.json { render json: @media_object.errors, status: :unprocessable_entity }
      end
    end
  end

    # DELETE /works/1
  # DELETE /works/1.json
  def destroy
  	@media_object = MediaObject.find(params[:id])
  	@work = @media_object.work

    @media_object.destroy
    respond_to do |format|
      format.html { redirect_to edit_work_path(@work), notice: 'Media object was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def media_object_params
      params.require(:media_object).permit(:work_id, :image, :caption, :video, :featured)
    end

    def signed_in_user
      unless signed_in?
        redirect_to new_user_session_path, notice: "Please sign in."
      end
    end
end
