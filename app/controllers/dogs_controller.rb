class DogsController < ApplicationController

  def index
    @dogs = Dog.all
    render json: @dogs
  end

  def create
    @dog = Dog.new(dog_params)
    
    if @dog.valid?
      @dog.save
      render json: @dog
    else
      render json: @dog.errors.messages
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age)
  end

end
