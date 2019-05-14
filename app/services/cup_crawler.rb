require 'open-uri'
require 'nokogiri'
require 'csv'


class CupCrawler
  def self.other
    user_agent = "User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:28.0) Gecko/20100101 Firefox/28.0"
    charset = nil

    ["https://kakaku.com/instant-food/cup-ramen/itemlist.aspx", "https://kakaku.com/instant-food/cup-ramen/itemlist.aspx?pdf_pg=2", "https://kakaku.com/instant-food/cup-ramen/itemlist.aspx?pdf_pg=3", "https://kakaku.com/instant-food/cup-ramen/itemlist.aspx?pdf_pg=4"].each do |url|
      doc = Nokogiri::HTML(open(url))
      doc.xpath('//table[@id="compTblList"]/tbody/tr[position() > 3]').each_with_index do |node, i|
        if i % 2 == 0
          p node.xpath('td[2]/table/tr/td[1]/a/span').inner_text.gsub(/[[:space:]]/, '')
          p node.xpath('td[2]/table/tr/td[1]/a/text()').inner_text.gsub(/g.*/, '').gsub(/\d{2,4}.*/, '').gsub(/[[:space:]]/, '')
        else
          p node.xpath('td[1]/a/img').attribute('src')&.value
        end
      end
    end

  end

  def self.crawler
    user_agent = "User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:28.0) Gecko/20100101 Firefox/28.0"
    charset = nil


    ["https://kakaku.com/instant-food/cup-ramen/itemlist.aspx", "https://kakaku.com/instant-food/cup-ramen/itemlist.aspx?pdf_pg=2", "https://kakaku.com/instant-food/cup-ramen/itemlist.aspx?pdf_pg=3", "https://kakaku.com/instant-food/cup-ramen/itemlist.aspx?pdf_pg=4"].each do |url|
      doc = Nokogiri::HTML(open(url))
      doc.xpath('//table[@id="compTblList"]/tbody/tr[position() > 3]').each_with_index do |node, i|
        if i % 2 == 0
          p node.xpath('td[2]/table/tr/td[1]/a/span').inner_text.gsub(/[[:space:]]/, '')
          p node.xpath('td[2]/table/tr/td[1]/a/text()').inner_text.gsub(/g.*/, '').gsub(/\d{2,4}.*/, '').gsub(/[[:space:]]/, '')
        else
          p node.xpath('td[1]/a/img').attribute('src')&.value
        end
      end
    end

    ["https://kakaku.com/instant-food/cup-yakisoba/itemlist.aspx", "https://kakaku.com/instant-food/cup-yakisoba/itemlist.aspx?pdf_pg=2"].each do |url|
      doc = Nokogiri::HTML(open(url))
      doc.xpath('//table[@id="compTblList"]/tbody/tr[position() > 2]').each_with_index do |node, i|
        if i % 3 == 0 
          next
        elsif i % 3 == 1
          p node.xpath('td[2]/table/tr/td[1]/a/span').inner_text.gsub(/[[:space:]]/, '')
          p node.xpath('td[2]/table/tr/td[1]/a/text()').inner_text.gsub(/g.*/, '').gsub(/\d{2,4}.*/, '').gsub(/[[:space:]]/, '')  
        elsif i % 3 == 2
          p node.xpath('td[1]/a/img').attribute('src')&.value
        end
      end
    end

    ["https://kakaku.com/instant-food/cup-wheat-noodle/itemlist.aspx", "https://kakaku.com/instant-food/cup-wheat-noodle/itemlist.aspx?pdf_pg=2"].each do |url|
      doc = Nokogiri::HTML(open(url))
      doc.xpath('//table[@id="compTblList"]/tbody/tr[position() > 2]').each_with_index do |node, i|
        if i % 3 == 0 
          next
        elsif i % 3 == 1
          p node.xpath('td[2]/table/tr/td[1]/a/span').inner_text.gsub(/[[:space:]]/, '')
          p node.xpath('td[2]/table/tr/td[1]/a/text()').inner_text.gsub(/g.*/, '').gsub(/\d{2,4}.*/, '').gsub(/[[:space:]]/, '')  
        elsif i % 3 == 2
          p node.xpath('td[1]/a/img').attribute('src')&.value
        end
      end
    end

    url = "https://kakaku.com/instant-food/cup-soba/itemlist.aspx"
    doc = Nokogiri::HTML(open(url))
    doc.xpath('//table[@id="compTblList"]/tbody/tr[position() > 2]').each_with_index do |node, i|
      if i % 3 == 0 
        next
      elsif i % 3 == 1
        p node.xpath('td[2]/table/tr/td[1]/a/span').inner_text.gsub(/[[:space:]]/, '')
        p node.xpath('td[2]/table/tr/td[1]/a/text()').inner_text.gsub(/g.*/, '').gsub(/\d{2,4}.*/, '').gsub(/[[:space:]]/, '')  
      elsif i % 3 == 2
        p node.xpath('td[1]/a/img').attribute('src')&.value
      end
    end

    url = "https://kakaku.com/instant-food/other-instant-food/itemlist.aspx"
    doc = Nokogiri::HTML(open(url))
    doc.xpath('//table[@id="compTblList"]/tbody/tr[position() > 3]').each_with_index do |node, i|
      if i % 2 == 0
        p node.xpath('td[2]/table/tr/td[1]/a/span').inner_text.gsub(/[[:space:]]/, '')
        p node.xpath('td[2]/table/tr/td[1]/a/text()').inner_text.gsub(/g.*/, '').gsub(/\d{2,4}.*/, '').gsub(/[[:space:]]/, '')
      else
        p node.xpath('td[1]/a/img').attribute('src')&.value
      end
    end

  end

end