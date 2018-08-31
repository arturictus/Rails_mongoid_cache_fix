# Rails Cache SystemStackError: stack level too deep

Dependencies:
- Rails 5.2.1
- Mongoid >= 6

## Problem:
Mongoid Models return an array when called `to_a`

```ruby
article = Article.create!(name: 'Rails rocks', content: 'Yep!')
# => #<Article _id: 5b89612ad80e4c90e98b9abe, name: "Rails rocks", content: "Yep!">
article.to_a
# => [#<Article _id: 5b89612ad80e4c90e98b9abe, name: "Rails rocks", content: "Yep!">]
```

## Possible solution:

The infinite loop is here:
https://github.com/rails/rails/blob/master/activesupport/lib/active_support/cache.rb#L663

Proposed solution:



### Test Error

```
bundle install
bundle exec rake test
```

### Test Pull Request

```
git checkout use_pr
bundle install
bundle exec rake test
```
