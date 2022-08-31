class ArticlesController < ApplicationController

	def index
		@articles = Article.all
		@articles = Article.paginate(page: params[:page], per_page: 3)
	end

	def new
		@articles = Article.new
	end

	def create
		@articles = Article.create(article_params)
		@articles.save
		respond_to do |format|
			format.html { redirect_to action: "index"}
		end
	end

	def show
		@articles = Article.find(params[:id])
	end

	def edit
		@articles = Article.find(params[:id])
	end

	def destroy
		@articles = Article.find(params[:id])
		@articles.destroy
		respond_to do |f|
			f.html { redirect_to action: "index", notice: "Article was successfully destroyed."}
		end
	end

	def update
		@articles = Article.find(params[:id])
		if @articles.save
			respond_to do |f|
				f.html { redirect_to action: "index", notice: "Article was successfully updated"}
			end
		end
	end

	def article_params
		params.require(:article).permit(:title, :body, :image, :user_id)
	end
end
