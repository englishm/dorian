class HomeController < ApplicationController
  caches_page :index

  def index
    @actions               = GithubAction.ordered.limit(5)
    @action_count_by_month = GithubAction.order('published_at ASC')
      .count_by{|a| a.published_at.beginning_of_month}
    @articles              = Article.ordered.limit(5)
    @book                  = Book.ordered.first
    @book_count_by_year    = Book.ordered.count_by{|b| b.finished_at.beginning_of_year}
    @fact                  = Fact.ordered.first
    @fact_count_by_day     = Fact.order('created_at ASC')
      .where('created_at > ?', 30.days.ago)
      .count_by{|f| f.created_at.beginning_of_day}
    @tweets                = Tweet.ordered.limit(10)
    @tweet_count_by_month  = Tweet.order('published_at ASC')
      .count_by{|t| t.published_at.beginning_of_month}
  end
end
