class ArticlesController < ApplicationController
  def index
    query = params[:q]
    category = params[:category]
    from = params[:from]
    to = params[:to]
    @categories = Article.distinct.pluck(:category)

    @articles = if query.present? || category.present? || (from.present? && to.present?)
                  Article.advanced_search(query:, category:, from:, to:)
                else
                  Article.all
                end
  end
end
