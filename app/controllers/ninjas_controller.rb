class NinjasController < ApplicationController
  def index
    @ninjas = Ninja.all
  end

  def show
    @ninja = Ninja.find(params[:id])
  end

  def new
    @ninja = Ninja.new
  end

  def edit
    @ninja = Ninja.find(params[:id])
  end

  def create
    @ninja = Ninja.new(ninja_params)

    respond_to do |format|
      if @ninja.save
        format.html { redirect_to @ninja, notice: "Ninja was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @ninja = Ninja.find(params[:id])
    respond_to do |format|
      if @ninja.update(ninja_params)
        format.html { redirect_to @ninja, notice: "Ninja was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @ninja = Ninja.find(params[:id])
    @ninja.destroy
    respond_to do |format|
      format.html { redirect_to ninjas_url, notice: "Ninja was successfully destroyed." }
    end
  end

  private

  def set_ninja
    @ninja = Ninja.find(params[:id])
  end

  def ninja_params
    params.require(:ninja).permit(:name, :guardian_name, :guardian_contact, :additional_information)
  end
end
