class StaticPageController < ApplicationController
	def home
		@artist = RSpotify::Artist.search('Arctic Monkeys').first
		@top_tracks = @artist.top_tracks(:US)
		@categories = RSpotify::Category.list
		#Removed Top List option from position 0 of array
		# recommendations = RSpotify::Recommendations.generate(seed_genres: ['blues', 'country'])
		@categories.shift
	end

	def recommended_artists
		cat_name = params[:cat_name].downcase
		# cat_name = "latin"
		recommendations = RSpotify::Recommendations.generate(seed_genres: [cat_name])
		@tracks = recommendations.tracks 
	end
end
