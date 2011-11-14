# encoding: utf-8
require 'rubygems'    
require 'nokogiri'    
require 'open-uri'    

class Url < ActiveRecord::Base
  belongs_to :source
  belongs_to :user
  
  def get_redirect_link(title, url, img, summary, type)
    url = url
    doc = Nokogiri::HTML.parse(open(url), nil, "UTF-8")  
    title = URI.escape doc.at_css("title").text
    
    case type
    when 'renren'
      "http://share.renren.com/share/buttonshare.do?link=" + url + "&title=" + title
    when 'douban'
      "http://shuo.douban.com/!service/share?image=" + img + "&href="+ url + "&name=" + title
    when 'sina'
      "http://v.t.sina.com.cn/share/share.php?title=" + title + "&url=" + url + "&pic=" + img
    when 'qzone'
      "http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=" + url + "&title=" + title + "&pics=" + "&summary=" + summary
    when 'kaixin'
      "http://www.kaixin001.com/repaste/share.php?rtitle="+ title + "&rurl="+ url + "&rcontent=" + summary
    when 'tt'
      #"http://v.t.qq.com/share/share.php?title=" + title + "&pic=" + img
      app_key = "7cab629032e843419ea857ccea113ddb"
      "http://share.v.t.qq.com/index.php?c=share&a=index&url=#{url}&appkey=#{app_key}&assname=&title=#{title}&pic="
    when 'sohu'
      URI.escape("http://t.sohu.com/third/post.jsp?url=" + url + "&title=" + title + "&content=" + summary + "&pic=")
    when 'msn'
      "http://profile.live.com/P.mvc#!/badge?url=" + url + "&screenshot="
    when 'taobao'
      "http://share.jianghu.taobao.com/share/addShare.htm?url=" + url
    when 'pengyou'
      "http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?to=pengyou&url=" + url
    when 'netease'
      "http://t.163.com/article/user/checkLogin.do?info=" + title + ' ' + url + "&images="
    when 'baidu_cang'
      "http://cang.baidu.com/do/add?it=" + title + "&iu=" + url
    when 'baidu_tieba'
      "http://cang.baidu.com/do/add?it=" + title + "&iu=" + url
    end
  end
end
