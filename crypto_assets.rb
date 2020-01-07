require 'json'

def sort_crypto_assets(filepath)
  crypto_assets = File.read(filepath)

  crypto_assets_array = JSON.parse(crypto_assets)

  ranked_array = []
  unranked_array = []

  crypto_assets_array.each do |crypto_asset|
    crypto_asset['rank'] ? ranked_array << crypto_asset : unranked_array << crypto_asset
  end
  ranked_array.sort_by! { |crypto_asset| crypto_asset['rank'].to_i }
  ranked_array << unranked_array

  File.open('ranked.json', 'wb') do |file|
    file.write(JSON.pretty_generate(ranked_array.flatten))
  end
end

sort_crypto_assets('input.json')
