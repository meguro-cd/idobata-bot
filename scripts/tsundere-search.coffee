module.exports = (robot) ->
  robot.hear /(.*)って何？/i, (msg) ->
    msg.http('http://www.google.com/search')
      .query(q: msg.match[0])
      .get() (err, res, body) ->
        match = body.match(/class="r"><a href="\/url\?q=([^"]*)(&amp;sa.*)">/)?[1] || ""
        msg.send msg.random [
          "#{match}
          はちゃんと読んできたのよね？"
          "いきなり聞かれても困るわよ！ま、調べておいてあげたけど。
          #{match}"
          "勘違いしないでよね！別にあんたのために調べたわけじゃないんだからっ！
          #{match}"
          "あんたの探してた情報、ここにあったわよ
          #{match}"
          "どうしてもっていうから、特別に調べてあげたのよ。感謝しなさいよねっ
          #{match}"
        ]