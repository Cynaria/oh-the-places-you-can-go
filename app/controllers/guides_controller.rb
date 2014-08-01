class GuidesController < ApplicationController
  before_action :set_guide, only: [:show, :edit, :update, :destroy]
  before_action :set_ip_address



  def index
    @locations = current_user.find_places_in_radius(20)
    @guides = current_user.find_guides_in_radius(20)
  end

  # GET /guides/1
  # GET /guides/1.json
  def show
    @locations = @guide.places
  end

  # GET /guides/new
  def new
    @guide = Guide.new
  end

  # GET /guides/1/edit
  def edit
    @center_point = @guide.get_center_point
    @locations = @guide.places
  end

  # POST /guides
  # POST /guides.json
  def create
    puts guide_params
    @guide = current_user.created_guides.new(guide_params)
    # guide_params[:places].each do |place|
    #   puts place
    # end

    respond_to do |format|
      if @guide.save
        format.json { render :show, status: :created, location: @guide }
        format.html { redirect_to @guide, notice: 'Guide was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guides/1
  # PATCH/PUT /guides/1.json
  def update
    respond_to do |format|
      if @guide.update(guide_params)
        format.html { redirect_to @guide, notice: 'Guide was successfully updated.' }
        format.json { render :show, status: :ok, location: @guide }
      else
        format.html { render :edit }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guides/1
  # DELETE /guides/1.json
  def destroy
    @guide.destroy
    respond_to do |format|
      format.html { redirect_to guides_url, notice: 'Guide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_ip_address
      current_user.ip_address = request.remote_ip
      current_user.geocode
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_guide
      @guide = Guide.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guide_params
      # json_params = ActionController::Parameters.new( JSON.parse(request.body.read) )
      params.permit(:name, :description, places_attributes: [:name, :description, :latitude, :longitude])
    end
end
