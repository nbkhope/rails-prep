class ArticlesController < ApplicationController
	def index
	end

	def create
		# We have to whitelist our controller parameters to prevent wrongful mass assignment
		@article = Article.new(params.require(:article).permit(:title, :text))
 
	  @article.save
	  redirect_to @article
	end
end
