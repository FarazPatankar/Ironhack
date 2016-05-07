require "sinatra"
require "sinatra/reloader" if development?
require 'httparty'
require 'json'

require_relative("lib/blog.rb")
require_relative("lib/post.rb")
require 'date'


blog = Blog.new
post1 = Post.new("Old post", "This post is very old", Date.new(2016, 1, 10), "Faraz", "Time")
post2 = Post.new("New post", "This is the latest post", Date.new(2016, 1, 20), "Josh", "Time")
blog.add_post(post1)
blog.add_post(post2)

get "/" do
	@new_blog = blog.latest_posts
	erb(:home)
end

get "/post_details/:index" do
	new_blog = blog.latest_posts
	number = params[:index].to_i
	@post = new_blog[number]
	erb(:post)
end

get "/new_post" do
	erb(:new_post)
end

post "/create_post" do
	title = params[:title]
	content = params[:content]
	author = params[:author]
	category = params[:category]

	if title == "" || content == "" || author == "" || category == ""
		redirect to("/new_post")
	else
		title = title.gsub(/</, "&lt;").gsub(/>/, "&gt;")
		content = content.gsub(/</, "&lt;").gsub(/>/, "&gt;")
		author = author.gsub(/</, "&lt;").gsub(/>/, "&gt;")
		new_post = Post.new(title, content, Date.today, author, category)
		blog.add_post(new_post)
		bot_away
		redirect to("/")
	end
end

get "/posts_by/:author" do
	new_blog = blog
	@author = params[:author]
	@posts_by_author = new_blog.posts_by_author(@author)
	erb(:author)
end

get "/posts_in/:category" do
	new_blog = blog
	@category = params[:category]
	@posts_by_category = new_blog.posts_by_author(@category)
	erb(:category)
end

def bot_away
	slack_webhook = "https://hooks.slack.com/services/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"
    HTTParty.post slack_webhook, body: {"text" => "Does this work?", "username" => "#slack-api-test", "channel" => "#slack-api-test"}.to_json, headers: {'content-type' => 'application/json'}
end

curl -X POST --data-urlencode 'payload={"channel": "@greyceli", "username": "justanotherbot", "text": "You are the best", "icon_emoji": ":alien:"}' https://hooks.slack.com/services/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
