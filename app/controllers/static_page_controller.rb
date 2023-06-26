class StaticPageController < ApplicationController
    def home
        # @artist = RSpotify::Artist.search('Arctic Monkeys').first
        # @top_tracks = @artist.top_tracks(:US)
        @categories = RSpotify::Category.list
        #Removed Top List option from position 0 of array
        @categories.shift

        #Remove categories that do not bring recommendations
        # i = 0
        # cats_without_recs = []
        # display_list = []
        # delete_at = []

        #Spotify doesn't give recommendations on these categories (10 September 2022)
        # no_recs = ["Regional Mexican", "Christian & Gospel", "EQUAL", "R&B", "Workout", "Wellness", "Decades", "Pride", "RADAR", "At Home", "API Heritage Month", "Focus", "Kids & Family", "Dance/Electronic"]
        # no_recs = []
        # cats_total = @categories.count
        # @categories.delete_if { |cat| no_recs.include?(cat.name) }
        
        #Filter
        @random_category = @categories.second
        # recommendations = RSpotify::Recommendations.generate(seed_genres: [@random_category.name.downcase])
        
        # @random_track = recommendations.tracks.sample
    end

    def recommended_artists
        @cat_name = params[:cat_name].downcase
        # cat_name = "latin"
        recommendations = RSpotify::Recommendations.generate(seed_genres: [@cat_name])
        @tracks = recommendations.tracks 
    end
end
