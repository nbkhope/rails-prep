class ArticlesController < ApplicationController
	def show
		@article = Article.find(params[:id])
	end
	
	def index
	end

	def create
		@article = Article.new(article_params)
 
	  @article.save
	  redirect_to @article
	end

	private

	# We have to whitelist our controller parameters to prevent wrongful mass assignment
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
