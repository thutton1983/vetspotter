class VeterinariansController < ApplicationController
  before_action :set_veterinarian, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :check_user, except: [:index, :show, :search]

  # GET /veterinarians
  # GET /veterinarians.json
  def index
    @veterinarians = Veterinarian.all.paginate(page: params[:page], per_page: 10)
end

  def search
    if params[:search].present?
      @veterinarians = Veterinarian.search(params[:search])
    else
      @veterinarians = Veterinarian.all
    end
  end

  # GET /veterinarians/1
  # GET /veterinarians/1.json
  def show
    @reviews=Review.where(veterinarian_id: @veterinarian.id).order("created_at DESC")
    if @reviews.blank?
      @avg_rating = 0
    else @avg_rating = @reviews.average(:rating).round(3)
    end
  end

  # GET /veterinarians/new
  def new
    @veterinarian = Veterinarian.new
  end

  # GET /veterinarians/1/edit
  def edit
  end

  # POST /veterinarians
  # POST /veterinarians.json
  def create
    @veterinarian = Veterinarian.new(veterinarian_params)

    respond_to do |format|
      if @veterinarian.save
        format.html { redirect_to @veterinarian, notice: 'Veterinarian was successfully created.' }
        format.json { render :show, status: :created, location: @veterinarian }
      else
        format.html { render :new }
        format.json { render json: @veterinarian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /veterinarians/1
  # PATCH/PUT /veterinarians/1.json
  def update
    respond_to do |format|
      if @veterinarian.update(veterinarian_params)
        format.html { redirect_to @veterinarian, notice: 'Veterinarian was successfully updated.' }
        format.json { render :show, status: :ok, location: @veterinarian }
      else
        format.html { render :edit }
        format.json { render json: @veterinarian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /veterinarians/1
  # DELETE /veterinarians/1.json
  def destroy
    @veterinarian.destroy
    respond_to do |format|
      format.html { redirect_to veterinarians_url, notice: 'Veterinarian was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veterinarian
      @veterinarian = Veterinarian.find(params[:id])
    end

    def check_user
      unless current_user.admin?
        redirect_to root_url, alert: "Sorry, only admins can do that."
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def veterinarian_params
      params.require(:veterinarian).permit(:name, :address, :phone, :website, :image)
    end
end
