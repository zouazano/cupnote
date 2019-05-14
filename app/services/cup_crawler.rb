require 'open-uri'
require 'nokogiri'
require 'csv'


class CupCrawler
  def self.other
    user_agent = "User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:28.0) Gecko/20100101 Firefox/28.0"
    charset = nil

    url = "https://kakaku.com/instant-food/other-instant-food/itemlist.aspx"
    doc = Nokogiri::HTML(open(url))
    doc.xpath('//table[@id="compTblList"]/tbody/tr[position() > 3]').each_slice(2) do |node|
      maker = Maker.find_or_create_by(name: node.first.xpath('td[2]/table/tr/td[1]/a/span').inner_text.gsub(/[[:space:]]/, ''))
      cup = Cup.find_or_create_by(name: node.first.xpath('td[2]/table/tr/td[1]/a/text()').inner_text.gsub(/g.*/, '').gsub(/\d{2,4}.*/, '').gsub(/[[:space:]]/, ''))
      image_id = node.second.xpath('td[1]/a/img').attribute('src')&.value
      cup.update(maker_id:maker.id, image_id:image_id)
    end
  end

  def self.crawl
    user_agent = "User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:28.0) Gecko/20100101 Firefox/28.0"
    charset = nil

    url = "https://kakaku.com/instant-food/other-instant-food/itemlist.aspx"
    doc = Nokogiri::HTML(open(url))
    doc.xpath('//table[@id="compTblList"]/tbody/tr[position() > 3]').each_slice(2) do |node|
      maker = Maker.find_or_create_by(name: node.first.xpath('td[2]/table/tr/td[1]/a/span').inner_text.gsub(/[[:space:]]/, ''))
      cup = Cup.find_or_create_by(name: node.first.xpath('td[2]/table/tr/td[1]/a/text()').inner_text.gsub(/g.*/, '').gsub(/\d{2,4}.*/, '').gsub(/[[:space:]]/, ''))
      image_id = node.second.xpath('td[1]/a/img').attribute('src')&.value
      cup.update(maker_id:maker.id, image_id:image_id)
    end

    ["https://kakaku.com/instant-food/cup-wheat-noodle/itemlist.aspx", "https://kakaku.com/instant-food/cup-wheat-noodle/itemlist.aspx?pdf_pg=2"].each do |url|
      doc = Nokogiri::HTML(open(url))
      doc.xpath('//table[@id="compTblList"]/tbody/tr[position() > 2]').each_slice(3) do |node|
        next if node.second.nil?
        maker = Maker.find_or_create_by(name: node.second.xpath('td[2]/table/tr/td[1]/a/span').inner_text.gsub(/[[:space:]]/, ''))
        cup = Cup.find_or_create_by(name: node.second.xpath('td[2]/table/tr/td[1]/a/text()').inner_text.gsub(/g.*/, '').gsub(/\d{2,4}.*/, '').gsub(/[[:space:]]/, ''))
        image_id = node.third.xpath('td[1]/a/img').attribute('src')&.value
        cup.update(maker_id:maker.id, image_id:image_id)
      end
    end

    ["https://kakaku.com/instant-food/cup-yakisoba/itemlist.aspx", "https://kakaku.com/instant-food/cup-yakisoba/itemlist.aspx?pdf_pg=2"].each do |url|
      doc = Nokogiri::HTML(open(url))
      doc.xpath('//table[@id="compTblList"]/tbody/tr[position() > 2]').each_slice(3) do |node|
        next if node.second.nil?
        maker = Maker.find_or_create_by(name: node.second.xpath('td[2]/table/tr/td[1]/a/span').inner_text.gsub(/[[:space:]]/, ''))
        cup = Cup.find_or_create_by(name: node.second.xpath('td[2]/table/tr/td[1]/a/text()').inner_text.gsub(/g.*/, '').gsub(/\d{2,4}.*/, '').gsub(/[[:space:]]/, ''))
        image_id = node.third.xpath('td[1]/a/img').attribute('src')&.value
        cup.update(maker_id:maker.id, image_id:image_id)
      end
    end

    url = "https://kakaku.com/instant-food/cup-soba/itemlist.aspx"
    doc = Nokogiri::HTML(open(url))
    doc.xpath('//table[@id="compTblList"]/tbody/tr[position() > 2]').each_slice(3) do |node|
      next if node.second.nil?
      maker = Maker.find_or_create_by(name: node.second.xpath('td[2]/table/tr/td[1]/a/span').inner_text.gsub(/[[:space:]]/, ''))
      cup = Cup.find_or_create_by(name: node.second.xpath('td[2]/table/tr/td[1]/a/text()').inner_text.gsub(/g.*/, '').gsub(/\d{2,4}.*/, '').gsub(/[[:space:]]/, ''))
      image_id = node.third.xpath('td[1]/a/img').attribute('src')&.value
      cup.update(maker_id:maker.id, image_id:image_id)
    end

    ["https://kakaku.com/instant-food/cup-ramen/itemlist.aspx", "https://kakaku.com/instant-food/cup-ramen/itemlist.aspx?pdf_pg=2", "https://kakaku.com/instant-food/cup-ramen/itemlist.aspx?pdf_pg=3", "https://kakaku.com/instant-food/cup-ramen/itemlist.aspx?pdf_pg=4"].each do |url|
      doc = Nokogiri::HTML(open(url))
      doc.xpath('//table[@id="compTblList"]/tbody/tr[position() > 3]').each_slice(2) do |node|
        maker = Maker.find_or_create_by(name: node.first.xpath('td[2]/table/tr/td[1]/a/span').inner_text.gsub(/[[:space:]]/, ''))
        cup = Cup.find_or_create_by(name: node.first.xpath('td[2]/table/tr/td[1]/a/text()').inner_text.gsub(/g.*/, '').gsub(/\d{2,4}.*/, '').gsub(/[[:space:]]/, ''))
        image_id = node.second.xpath('td[1]/a/img').attribute('src')&.value
        cup.update(maker_id:maker.id, image_id:image_id)
      end
    end

  end

end