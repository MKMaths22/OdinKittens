class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(allowed_params)
    if @kitten.save
      redirect_to kitten_path(id: @kitten.id)
      flash[:notice] = "You added #{@kitten.name} successfully."
    else
      flash.now[:alert] = 'This kitten cannot be added, bozo!'
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(allowed_params)
      flash[:notice] = "You successfully updated this Kitten."
      redirect_to kitten_path(id: @kitten.id)
    else
      flash.now[:alert] = "This kitten's details cannot be updated. Ensure your fingers are not too clumsy next time."
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    deleted_name = @kitten.name
    @kitten.destroy
    flash[:notice] = "You destroyed #{deleted_name}, you monster!"
    redirect_to root_path
  end

  private

  def allowed_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
