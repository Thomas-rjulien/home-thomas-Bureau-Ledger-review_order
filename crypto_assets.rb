require 'json'

def sort_crypto_assets(filepath)
  crypto_assets = File.read(filepath)

  crypto_assets_array = JSON.parse(crypto_assets)

  ranked_array = []
  unranked_array = []

  crypto_assets_array.each do |crypto_asset|
    crypto_asset['rank'].nil? ? unranked_array << crypto_asset : ranked_array << crypto_asset
  end

  ranked_array.sort_by! { |crypto_asset| crypto_asset['rank'].to_i }
  File.open('ranked.json', 'wb') do |file|
    file.write(JSON.pretty_generate(ranked_array))
  end
  File.open('unranked.json', 'wb') do |file|
    file.write(JSON.pretty_generate(unranked_array))
  end
end

sort_crypto_assets('input.json')
