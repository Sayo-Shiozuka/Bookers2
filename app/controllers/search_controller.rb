class SearchController < ApplicationController

  def search
    @book_or_user = params[:option]
    @how_search = params[:choice]
    @search = params[:search]

    if @book_or_user == "1"
      @books = Book.search(params[:search], @book_or_user, @how_search)
    else
      @users = User.search(params[:search], @book_or_user, @how_search)
    end
    #binding.pry
    
    # @model = params["search"]["model"]
    # @content = params["search"]["content"]
    # @method = params["search"]["method"]
    # @records = search_for(@model,@content, @method).page(params[:page]).per(5)
  end

  # private
  # def search_for(model,content,method)
  #   if model == 'book'
  #     method == 'partial'
  #     Book.where('family_name LIKE ?', '%'+content+'%')
  #   else
  #     method == 'partial'
  #     User.where('name LIKE ?', '%'+content+'%')
  #   end
  # end
end
