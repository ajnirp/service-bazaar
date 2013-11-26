class CategoriesController < ApplicationController
  def show
    @category = Category.find(request.original_url.split('/').last)
  end
end
