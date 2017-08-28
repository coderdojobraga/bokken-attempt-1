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

    if @ninja.save
      redirect_to @ninja, notice: "Ninja was successfully created."
    else
      render :new
    end
  end

  def update
    @ninja = Ninja.find(params[:id])

    if @ninja.update(ninja_params)
      redirect_to @ninja, notice: "Ninja was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    ninja = Ninja.where(id: params[:id]).first

    if ninja.try(:destroy)
      redirect_to ninjas_url, notice: "Ninja was successfully destroyed."
    else
      redirect_to ninjas_url
    end
  end

  private

  def ninja_params
    params.require(:ninja).permit(:name, :guardian_name,
      :guardian_contact, :additional_information)
  end
end
