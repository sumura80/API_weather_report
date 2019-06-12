namespace :scraper do
  desc "データを取得する"
  task scrape: :environment do
  	require 'net/http'
		require 'uri'
		require 'json'
		require 'time'
		require 'date'

		uri = URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=110010')
		json = Net::HTTP.get(uri)
		result = JSON.parse(json) 
		puts result['forecasts'][0]['date']
		puts result['forecasts'][1]['date']

		#データの保存
		  result['forecasts'].each do |forecast|
			#post作成
				@post = Post.new
				@post.when = forecast['dateLabel']
				@post.tenki = forecast['telop']
				@post.date = forecast['date']
				@post.max = forecast['temperature']['max']['celsius']if forecast['temperature']['max'].present?
				@post.min = forecast['temperature']['min']['celsius'] if forecast['temperature']['min'].present?
				@post.image_url = forecast['image']['url']

				# if forecast['temperature']['max']['celsius'].present?
				# 	@post.max = forecast['temperature']['max']['celsius'] 
				# end
				# if forecast['temperature']['min'].present?
				# 	@post.min = forecast['temperature']['min']['celsius'] 
				# else
				# 	@post.min = ""
				# end

				#post Save
				@post.save
		end
  end

  desc "データベースの中身を削除する"
  task destory_all_posts: :environment do
  	Post.destroy_all
  end

end
