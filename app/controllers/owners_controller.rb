class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /owners
  # GET /owners.json
  def index
    @owners = Owner.all
  end

  def index
    if params[:search_owner]
      @owners = Owner.where("last_name LIKE ?", "%#{params[:search_owner]}%")
      if @owners.size.zero?
        flash[:notice] = "No result found"
        @owners.all
      end
    else
      @owners = Owner.all
    end
  end

  # GET /owners/1
  # GET /owners/1.json
  def show
  end

  # GET /owners/new
  def new
    @owner = Owner.new
  end

  # GET /owners/1/edit
  def edit
  end

  # POST /owners
  # POST /owners.json
  def create
    @owner = Owner.new(owner_params)

    respond_to do |format|
      if @owner.save
        format.html { redirect_to @owner, notice: 'Owner was successfully created.' }
        format.json { render :show, status: :created, location: @owner }
      else
        format.html { render :new }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owners/1
  # PATCH/PUT /owners/1.json
  def update
    respond_to do |format|
      if @owner.update(owner_params)
        format.html { redirect_to @owner, notice: 'Owner was successfully updated.' }
        format.json { render :show, status: :ok, location: @owner }
      else
        format.html { render :edit }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @owner.destroy
    respond_to do |format|
      format.html { redirect_to owners_url, notice: 'Owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner
      @owner = Owner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def owner_params
      params.require(:owner).permit(:last_name, :first_name, :phone, :emergency_name, :emergency_phone)
    end
end
