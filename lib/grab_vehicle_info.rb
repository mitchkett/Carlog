webpage = open('http://dir.yahoo.com/recreation/automotive/makes_and_models/') { |s| Hpricot(s) }
(webpage/"div.cat/ul/li/a").each do |make|
  make_link = make.attributes['href']
  make_name = (make/"b").inner_text
  puts '===' + make_name + '==='
  begin
    model_page = open('http://dir.yahoo.com/recreation/automotive/makes_and_models/' + make_link + 'Models/') {|r| Hpricot(r)} 
    (model_page/"div.st/ul/li/a/b").each do |mod|
      puts mod.inner_text
    end
  rescue
    puts 'No models'
  end
end