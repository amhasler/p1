class ResourceObjectsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
	# GET /works/new
  def new
    @resource_object = ResourceObject.new
    @work = Work.find(params[:work_id])
  end

	def create
    @resource_object = ResourceObject.new(resource_object_params)
    @work = Work.find(params[:resource_object][:work_id])

    respond_to do |format|
      if @resource_object.save
        format.html { redirect_to edit_work_path(@work), notice: 'Resource object was successfully created.' }
        format.json { render :show, status: :created, location: @resource_object }
      else
        format.html { render :new }
        format.json { render json: @resource_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /works/1/edit
  def edit
  	@resource_object = ResourceObject.find(params[:id])
  	@work = Work.find(params[:work_id])

  end

  def update
  	@resource_object = ResourceObject.find(params[:id])
  	@work = @resource_object.work

  	respond_to do |format|
      if @resource_object.update(resource_object_params)
        format.html { redirect_to edit_work_path(@work), notice: 'Resource object was successfully updated.' }
        format.json { render :show, status: :ok, location: @work }
      else
        format.html { render :edit }
        format.json { render json: @resource_object.errors, status: :unprocessable_entity }
      end
    end
  end

    # DELETE /works/1
  # DELETE /works/1.json
  def destroy
  	@resource_object = ResourceObject.find(params[:id])
  	@work = @resource_object.work

    @resource_object.destroy
    respond_to do |format|
      format.html { redirect_to edit_work_path(@work), notice: 'Resource object was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_object_params
      params.require(:resource_object).permit(:work_id, :title, :link, :description)
    end

    def signed_in_user
      unless signed_in?
        redirect_to new_user_session_path, notice: "Please sign in."
      end
    end
end
