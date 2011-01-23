require File.dirname(__FILE__) + '/../config/environment'

webpage = open('http://dir.yahoo.com/recreation/automotive/makes_and_models/') { |s| Hpricot(s) }
(webpage/"div.cat/ul/li/a").each do |make|
  make_link = make.attributes['href']
  make_name = (make/"b").inner_text
  make = VehicleMake.create!(:name => make_name)
  puts '===' + make_name + '==='
  begin
    model_page = open('http://dir.yahoo.com/recreation/automotive/makes_and_models/' + make_link + 'Models/') {|r| Hpricot(r)} 
    (model_page/"div.st/ul/li/a/b").each do |mod|
      model_name = mod.inner_text
      model = make.models.create!(:name => model_name)
      puts model_name
    end
  rescue
    puts 'No models'
  end
end