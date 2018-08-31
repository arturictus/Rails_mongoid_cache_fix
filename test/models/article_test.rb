require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "Rails.cache.fetch stack level too deep" do
    article = Article.create!(name: 'Rails rocks', content: 'Yep!')
    Rails.cache.fetch(article) { article.attributes }
  end

  test "Rails.cache.read stack level too deep" do
    article = Article.create!(name: 'Rails rocks', content: 'Yep!')
    Rails.cache.read(article)
  end

  test "Rails.cache.write stack level too deep" do
    article = Article.create!(name: 'Rails rocks', content: 'Yep!')
    assert Rails.cache.write(article, 'hello')
    assert Rails.cache.delete(article)
  end
end
