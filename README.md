### README
----
### Name: API_weather_report

### Overview:
無料のお天気WebサービスAPI（Livedoor Weather Web Service / LWWS）を使い、埼玉県の天気予報を表示する。
本日・明日・明後日まで取得できる。
該当するパラメータ名を持ってきて、APIにある天気予報の画像も表示。
まだ自動で取得できるようにしていないが、手動ではターミナルで下記の方法で取得可能。
取得：rake scraper:scrape
削除：destory_all_posts


### 使用したGems:
```
1. bootstrap-sass
2. sassc-rails
```

### Description 
Rails: 5.1.7

`lib/tasks/scraper.rake` に取得方法を下記のようの記述
````
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

		@post.save
		end
  end

  desc "データベースの中身を削除する"
  task destory_all_posts: :environment do
  	Post.destroy_all
  end

end
````
