class VideoRatingsController < ApplicationController
  before_action :set_video_rating, only: %i[ show edit update destroy ]

  # GET /video_ratings or /video_ratings.json
  def index
    @video_ratings = VideoRating.all
  end

  # GET /video_ratings/1 or /video_ratings/1.json
  def show
  end

  # GET /video_ratings/new
  def new
    @video_rating = VideoRating.new
  end

  # GET /video_ratings/1/edit
  def edit
  end

  # POST /video_ratings or /video_ratings.json
  def create
    @video_rating = VideoRating.new(video_rating_params)

    respond_to do |format|
      if @video_rating.save
        format.html { redirect_to @video_rating, notice: "Video rating was successfully created." }
        format.json { render :show, status: :created, location: @video_rating }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @video_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /video_ratings/1 or /video_ratings/1.json
  def update
    respond_to do |format|
      if @video_rating.update(video_rating_params)
        format.html { redirect_to @video_rating, notice: "Video rating was successfully updated." }
        format.json { render :show, status: :ok, location: @video_rating }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @video_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video_ratings/1 or /video_ratings/1.json
  def destroy
    @video_rating.destroy
    respond_to do |format|
      format.html { redirect_to video_ratings_url, notice: "Video rating was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video_rating
      @video_rating = VideoRating.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_rating_params
      params.require(:video_rating).permit(:video_id, :score)
    end
end
