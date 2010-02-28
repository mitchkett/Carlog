webpage = open('/Users/mitchkett/Desktop/ModelNamesAndMakes.html') {|s| Hpricot(s)}
(webpage/"td.body_103").each do |row|
  row.nodes_at(0).each do |cell|
    puts cell.inner_text.strip
  end
end