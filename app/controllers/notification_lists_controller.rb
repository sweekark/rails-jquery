class NotificationListsController < ApplicationController
  before_action :set_notification_list, only: [:show, :edit, :update, :destroy]

  # GET /notification_lists
  # GET /notification_lists.json
  def index
    @notification_lists = NotificationList.all
  end

  # GET /notification_lists/1
  # GET /notification_lists/1.json
  def show
  end

  # GET /notification_lists/new
  def new
    @notification_list = NotificationList.new
  end

  # GET /notification_lists/1/edit
  def edit
  end

  # POST /notification_lists
  # POST /notification_lists.json
  def create
    @notification_list = NotificationList.new(notification_list_params)

    respond_to do |format|
      if @notification_list.save
        format.html { redirect_to @notification_list, notice: 'Notification list was successfully created.' }
        format.json { render :show, status: :created, location: @notification_list }
      else
        format.html { render :new }
        format.json { render json: @notification_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notification_lists/1
  # PATCH/PUT /notification_lists/1.json
  def update
    respond_to do |format|
      if @notification_list.update(notification_list_params)
        format.html { redirect_to @notification_list, notice: 'Notification list was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification_list }
      else
        format.html { render :edit }
        format.json { render json: @notification_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notification_lists/1
  # DELETE /notification_lists/1.json
  def destroy
    @notification_list.destroy
    respond_to do |format|
      format.html { redirect_to notification_lists_url, notice: 'Notification list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification_list
      @notification_list = NotificationList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_list_params
      params.require(:notification_list).permit(:name, :email, :phno)
    end
end
