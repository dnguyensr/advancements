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
    @requirement = Requirement.find(params[:id])
    partial = view_context.render partial: "edit_ajax_form", layout: false, locals: {advancement: @advancement, rank: @rank, requirement: @requirement}
    respond_to do |format|
      format.json {
        render json: {
          html: partial,
          id: params[:id]
        }
      }
      format.html {}
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
    @requirement = Requirement.find(params[:id])
    respond_to do |format|
      if @requirement.update(requirement_params)
        format.json { render json: {
            # number: @advancement.number,
            # description: @advancement.description,
            completed: @advancement.completed,
            # rank_id: params[:rank_id],
            # id: params[:id]
          }
        }
        format.html { redirect_to advancement_path(@advancement), notice: 'Requirement was successfully updated.' }
      else
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
        format.html { render :edit }
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
