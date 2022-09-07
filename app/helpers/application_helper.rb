module ApplicationHelper
	require 'httparty'

	def call_api
		include HTTParty
		# HTTParty.get('https://api.nytimes.com/svc/books/v3/lists/combined-print-and-e-book-fiction.json?api-key=yourApiKey')
		client_id = "9bb50c2cbab14498b43024bdccb8bfc0"
		client_secret = "7db5546024e6414f9d2a6ce402f709c3"
		client_id_and_secret = Base64.strict_encode64("#{client_id}:#{client_secret}")
		result = HTTParty.post(
		    "https://accounts.spotify.com/api/token",
		    :body => {:grant_type => "refresh_token",
		              :refresh_token => "#{self.oauth_refresh_token}"},
		    :headers => {"Authorization" => "Basic #{client_id_and_secret}"}
		    )

	end

end
