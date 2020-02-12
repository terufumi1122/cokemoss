class Api::V1::PinsController < ApplicationController
  include NetHttpModule
  
  def index
    url = "https://api.pinterest.com/v1/me/pins/?access_token=#{Rails.application.credentials.api_key[:pinterest]}&fields=id%2Cnote%2Curl%2Cimage"
    response = api_get(url)
    # puts response.code

    # 429(リクエスト多すぎ)ならエラーメッセージ返す
    if response.code == "429"
      render json: {error: 'リクエスト回数が上限に達しました。しばらく経ってからやり直して下さい'}
    elsif response.code == "200"
      pins = JSON.parse(response.body)['data']
      pins_count = pins.length
      
      # 返ってきたデータの分だけ画像データをDBに保存する
      pins.each do |pin|
        Pin.create(pin_id: pin['id'],
                  pin_url: pin['url'],
                  image_url: pin['image']['original']['url'],
                  width: pin['image']['original']['width'],
                  height: pin['image']['original']['height'])
      end

      # Vue.jsに返す値を定義する
      res = {
        pins: Pin.all.as_json,
        # cursor: Page.last.cursor,
      }
      render json: res
    end
    # Page.create(cursor: response.page.cursor)

    # if response.code
    # render json: res, status: response.code
    # else
      # render status: :unprocessable_entity
    # end
  end

  def create
  end

  def update
  end

  def destroy
  end
end
