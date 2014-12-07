class UploadsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  respond_to :html

  def index
    @uploads = @uploads.order(uploaded_at: :desc).page(params[:page])
  end
  
  def show; end

  def new; end

  def create
    uploaded_file = params[:upload][:file]
    if uploaded_file.present? && uploaded_file.size > 0
      @upload.built_uploaded_trips_from_file(uploaded_file)
    else
      @upload.errors.add(:base, "Please select a valid CSV file to upload")
    end
        
    if @upload.errors.empty? && @upload.save
      redirect_to action: :index, notice: "Upload successful"
    else
      render :new
    end
  end
end
