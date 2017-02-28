class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy]

  def index
    @requirements = Requirement.all
  end

  def show
  end

  def new
    @requirement = Requirement.new
  end

  def edit
    @advancement = Advancement.find(params[:advancement_id])
    @rank = Rank.find(params[:rank_id])

    if request.xhr?
      partial = view_context.render partial: "ajax_form", layout: false, locals: { advancement: @advancement, rank: @rank }

      render json: {
        html: partial,
        id: params[:id]
      }
    end
  end

  def create
    @requirement = Requirement.new(requirement_params)

    respond_to do |format|
      if @requirement.save
        format.html { redirect_to @requirement, notice: 'Requirement was successfully created.' }
        format.json { render :show, status: :created, location: @requirement }
      else
        format.html { render :new }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @advancement = Advancement.find(params[:advancement_id])
    respond_to do |format|
      if @requirement.update(requirement_params)
        format.html { redirect_to advancement_path(@advancement), notice: 'Requirement was successfully updated.' }
        format.json { render :show, status: :ok, location: @requirement }
      else
        format.html { render :edit }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @requirement.destroy
    respond_to do |format|
      format.html { redirect_to requirements_url, notice: 'Requirement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_requirement
      @requirement = Requirement.find(params[:id])
    end

    def requirement_params
      params.require(:requirement).permit(:completed)
      # params.require(:requirement).permit(:number, :description, :completed, :rank_id)
    end
end
