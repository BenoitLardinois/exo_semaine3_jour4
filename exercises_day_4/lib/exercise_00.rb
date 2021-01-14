require 'nokogiri'
require 'open-uri'
require 'ruby_gem'

#TEST POUR SCRAPPER PLZ NOT MODIFIED!
#page = Nokogiri::HTML(URI.open("http://ruby.bastardsbook.com"))
#puts page.css("title")[0].name
#puts page.css("title").text
#links = page.css("a")
#puts links.length
#puts links[0].text
#puts links[0]["href"]
#news_links = page.css.select{|link| link['data-category'] == "news"}
#news_links.each{ |link| puts link['href']}
#puts news_links.class



def crypto_scrapper()

  #Nom de la page a scanner
  doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

  #Tableau des noms des cryptommaies
  currencies_names = []
  doc.xpath('//tbody/tr/td[3]/div').each do |link|
    currencies_names << link.text
  end
  
  #Tableau des valeurs des cryptommaies
  values_array = []
  doc.xpath('//tbody/tr/td[5]/div').each do |link|
    values_array << link.text
  end
  
  #Création du hash
  values_array = values_array.map{ |x| x.gsub(/[\s,]/ , "") }
  values_array = values_array.map{ |x| x.reverse.chop.reverse.to_f}
  result_hash = currencies_names.zip(values_array).to_h
  array_of_hashes = result_hash.each_slice(1).map &:to_h
  return array_of_hashes
end

print crypto_scrapper()