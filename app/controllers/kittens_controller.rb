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
    else
      flash.now[:alert] = 'This kitten cannot be added.'
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    if @kitten.update(allowed_params)
      redirect_to kitten_path(id: @kitten.id)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to 'root'
  end

  private

  def allowed_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
