
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))


def crypto_names(page)
crypto_names_array = []
page.xpath('//td[@class="text-left col-symbol"]').each do |name|
crypto_names_array << name.text
end
 return crypto_names_array
end



def crypto_prices(page)
crypto_prices_array = []
page.xpath('//a[@class="price"]').each do |price|
crypto_prices_array << price.text
  end
  return crypto_prices_array
end



def crypto_scrapper(page)
  arr = []
  i = 0
  puts "Patiente un peu stp, c'est long mais ca marche ! Je ne te montre que 50 crypto pour que tu ne passe pas la journee a attendre :)"
  50.times do |i|  #I put 50 because it is too long to go through 2000 - remplace 50 par "crypto_name.each" pour tout afficher
  arr.push ("{#{crypto_names(page)[i]} => #{crypto_prices(page)[i]}}")

  end
  return arr
end

puts crypto_scrapper (page)

#other method faster but not in line with the subject
=begin
def result(url_crypto)
 keys = crypto_names(url_crypto)
values = crypto_prices(url_crypto)   
zipped = keys.zip(values)
 final = Hash[zipped]
 return final
end

puts result(url_crypto)
=end