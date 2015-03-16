class RouterStatusesController < ApplicationController
  before_action :set_router_status, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:create] ,if: :json_request?

  # GET /router_statuses
  # GET /router_statuses.json
  def index
    @router_statuses = RouterStatus.status_display
  end

  # GET /router_statuses/1
  # GET /router_statuses/1.json
  def show
  end

  # GET /router_statuses/new
  def new
    @router_status = RouterStatus.new
  end

  # GET /router_statuses/1/edit
  def edit
  end

  # POST /router_statuses
  # POST /router_statuses.json
  def create
    @router_status = RouterStatus.new(router_status_params)

    respond_to do |format|
      if @router_status.save
        format.html { redirect_to @router_status, notice: 'Router status was successfully created.' }
        format.json { render :show, status: :created, location: @router_status }
      else
        format.html { render :new }
        format.json { render json: @router_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /router_statuses/1
  # PATCH/PUT /router_statuses/1.json
  def update
    respond_to do |format|
      if @router_status.update(router_status_params)
        format.html { redirect_to @router_status, notice: 'Router status was successfully updated.' }
        format.json { render :show, status: :ok, location: @router_status }
      else
        format.html { render :edit }
        format.json { render json: @router_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /router_statuses/1
  # DELETE /router_statuses/1.json
  def destroy
    @router_status.destroy
    respond_to do |format|
      format.html { redirect_to router_statuses_url, notice: 'Router status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def json_request?
      request.format.json?
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_router_status
      @router_status = RouterStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def router_status_params
      params.require(:router_status).permit(:router_id, :macid, :status)
    end
end
