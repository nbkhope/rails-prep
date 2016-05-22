class ArticlesController < ApplicationController	

	# require authentication to do any article action, except for index and show
	http_basic_authenticate_with name: "nobody", password: "secret", 
															 except: [:index, :show]

	def index
    @articles = Article.all
  end

	def show
		@article = Article.find(params[:id])
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

	# The delete routing method should be used for routes that destroy resources. 
	# If this was left as a typical get route, it could be possible for people to 
	# craft malicious URLs like this:
	#   <a href='http://example.com/articles/1/destroy'>look at this cat!</a>

	def destroy
	  @article = Article.find(params[:id])
	  @article.destroy
	 
	  redirect_to articles_path
	end

	private

	# We have to whitelist our controller parameters to prevent wrongful mass assignment
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
