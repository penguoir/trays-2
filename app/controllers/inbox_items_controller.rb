class InboxItemsController < ApplicationController
  before_action :set_inbox_item, only: %i[ show edit update destroy ]

  # GET /inbox_items or /inbox_items.json
  def index
    @inbox_items = InboxItem.all
  end

  # GET /inbox_items/1 or /inbox_items/1.json
  def show
  end

  # GET /inbox_items/new
  def new
    @inbox_item = InboxItem.new
  end

  # GET /inbox_items/1/edit
  def edit
  end

  # POST /inbox_items or /inbox_items.json
  def create
    @inbox_item = InboxItem.new(inbox_item_params)

    respond_to do |format|
      if @inbox_item.save
        format.html { redirect_to @inbox_item, notice: "Inbox item was successfully created." }
        format.json { render :show, status: :created, location: @inbox_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inbox_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inbox_items/1 or /inbox_items/1.json
  def update
    respond_to do |format|
      if @inbox_item.update(inbox_item_params)
        format.html { redirect_to @inbox_item, notice: "Inbox item was successfully updated." }
        format.json { render :show, status: :ok, location: @inbox_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inbox_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inbox_items/1 or /inbox_items/1.json
  def destroy
    @inbox_item.destroy!

    respond_to do |format|
      format.html { redirect_to inbox_items_path, status: :see_other, notice: "Inbox item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inbox_item
      @inbox_item = InboxItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def inbox_item_params
      params.expect(inbox_item: [ :body, :status ])
    end
end
