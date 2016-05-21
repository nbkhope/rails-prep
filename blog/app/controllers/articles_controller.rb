class ArticlesController < ApplicationController
	def show
		@article = Article.find(params[:id])
	end
	
	def index
    @articles = Article.all
  end

  def new
  	@article = Article.new
  end

  def edit
  	@article = Article.find(params[:id])
  end

	def create
		@article = Article.new(article_params)
 
	  if @article.save
	    redirect_to @article
	  else
	  	render 'new'
	  end
	end

	def update
		@article = Article.find(params[:id])

		# Note: You don't need to pass all attributes to update. For example, 
		# if you'd call @article.update(title: 'A new title') Rails would only 
		# update the title attribute, leaving all other attributes untouched.

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	private

	# We have to whitelist our controller parameters to prevent wrongful mass assignment
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
