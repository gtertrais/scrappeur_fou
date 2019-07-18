require 'nokogiri'
require 'open-uri'


annuaire_mairies = "https://www.annuaire-des-mairies.com/val-d-oise.html"

def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(open(townhall_url))
  email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
  return email.text
end



def townhall_url
  page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  townhall_urls = page.xpath('//a[@class="lientxt"]')
  urls = townhall_urls.map {|element| element["href"]}.compact
  urls_arr = []
  urls.each do |url|
  url = url[1..-1]
  url = url.prepend("https://www.annuaire-des-mairies.com")
  url = url
  urls_arr<< url
  end
  return urls_arr
end
 


def get_townhall_names(annuaire_mairies)
  names_arr = []
  page = Nokogiri::HTML(open(annuaire_mairies))
  page.xpath('//a[@class="lientxt"]').each do |name|
  names_arr << name.text
  end
  return names_arr
  end


def email_display(annuaire_mairies, townhall_url)
  arr = []
  i = 0
  puts "Patiente un peu stp, c'est long mais ca marche !"
  get_townhall_names(annuaire_mairies).each do |name|
  arr.push ("{#{name} => #{get_townhall_email(townhall_url[i])}}")
 i = i+1
  end
  return arr
end

puts email_display(annuaire_mairies, townhall_url)

