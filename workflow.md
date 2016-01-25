# how to test

`rake`

`kitchen test`

# how to publish

edit `metadata.rb` version

`git tag 0.1.x`

`git push -u origin 0.1.x`

`knife cookbook site share carton -VV`
