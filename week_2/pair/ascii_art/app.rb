require "sinatra"
require "artii"

# get "/ascii/:word/" do
# 	@word = params[:word]
# 	@ascii = Artii::Base.new
# 	@ascii_word = @ascii.asciify(@word)
# 	erb(:art)
# end

get "/ascii/:word/?:font?" do
	@word = params[:word]
	@font = params[:font]
	if @font.nil?
		@font = "slant"
	end
	ascii = Artii::Base.new :font => @font
	@ascii_word = ascii.asciify(@word)
	erb(:font_art)
end