class Share
  def self.release_url(title, url, image, summary, s_type)
    case s_type
    when 'renren'
      "http://share.renren.com/share/buttonshare.do?link=" + url + "&title=" + title
    when 'douban'
      "http://shuo.douban.com/!service/share?image=" + img + "&href="+ url + "&name=" + title
    when 'sina'
      "http://v.t.sina.com.cn/share/share.php?title=" + title + "&url=" + url + "&pic=" + img
    when 'qzone'
      "http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=" + url + "&title=" + title + "&pics=" + img + "&summary=" + summary
    when 'kaixin001'
      "http://www.kaixin001.com/repaste/share.php?rtitle="+ title + "&rurl="+ url + "&rcontent=" + summary
    when 'tt'
      "http://v.t.qq.com/share/share.php?title=" + title + "&pic=" + img
    when 'sohu'
      "http://t.sohu.com/third/post.jsp?url=" + url + "&title=" + title + "&content=" + summary + "&pic="
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