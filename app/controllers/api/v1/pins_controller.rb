class Api::V1::PinsController < ApplicationController
  include NetHttpModule
  
  def index
    url = "https://api.pinterest.com/v1/me/pins/?access_token=#{Rails.application.credentials.api_key[:pinterest]}&fields=id%2Cnote%2Curl%2Cimage"
    # NetHttpModuleで定義したapi_getメソッドを使用
    response = api_get(url)
    # 429(リクエスト多すぎ)ならエラーメッセージ返す
    if response.code == "429"
      render json: { error: response.message }, status: response.code
    elsif response.code == "200"
      #privateで定義したメソッドを使用してDBにデータを保存
      save_pins_and_cursor(response)
      # Vue.jsに返すJSONを作成する
      json_for_vue = {
        message: response.message,
        pins: Pin.all.as_json,
        cursor: Page.last.cursor
      }
      render json: json_for_vue, status: response.code
    else
      render json: { error: response.message }, status: response.code
    end
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end
  
  private

  def save_pins_and_cursor(response)
    pins = JSON.parse(response.body)['data']
    pins_count = pins.length
    # 返ってきたデータの分だけ画像データをDBに保存する
    pins.each do |pin|
      Pin.create(
                  pin_id: pin['id'],
                  pin_url: pin['url'],
                  image_url: pin['image']['original']['url'],
                  width: pin['image']['original']['width'],
                  height: pin['image']['original']['height']
                )
    end
    # ページ切り替えに必要な`cursor`情報をDBに保存する
    cursor = pins['page']['cursor']
    Page.create(cursor: cursor)
  end
end
