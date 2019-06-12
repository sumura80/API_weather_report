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
