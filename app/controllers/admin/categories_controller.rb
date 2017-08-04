class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  def index
    @category = Category.order(created_at: :desc).all

  end

  def new
    @category = Category.new
    render :new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new, notice: 'Category failed to create'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
