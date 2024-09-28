class NextActionsController < ApplicationController
  before_action :set_next_action, only: %i[ show edit update destroy ]

  # GET /next_actions or /next_actions.json
  def index
    @next_actions = Current.user.next_actions
  end

  # GET /next_actions/new
  def new
    @next_action = Current.user.next_actions.new
  end

  # GET /next_actions/1/edit
  def edit
  end

  # POST /next_actions or /next_actions.json
  def create
    @next_action = Current.user.next_actions.new(next_action_params)

    respond_to do |format|
      if @next_action.save
        format.html { redirect_to @next_action, notice: "Next action was successfully created." }
        format.json { render :show, status: :created, location: @next_action }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @next_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /next_actions/1 or /next_actions/1.json
  def update
    respond_to do |format|
      if @next_action.update(next_action_params)
        format.html { redirect_to @next_action, notice: "Next action was successfully updated." }
        format.json { render :show, status: :ok, location: @next_action }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @next_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /next_actions/1 or /next_actions/1.json
  def destroy
    @next_action.destroy!

    respond_to do |format|
      format.html { redirect_to next_actions_path, status: :see_other, notice: "Next action was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_next_action
      @next_action = NextAction.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def next_action_params
      params.expect(next_action: [ :project_id, :body, :done ])
    end
end
