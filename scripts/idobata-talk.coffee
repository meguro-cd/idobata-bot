module.exports = (robot) ->
  robot.hear /だよね$/i, (msg) ->
    msg.send "そうとは言い切れないね"

  robot.hear /ねむい|眠い|ネムイ|つかれた|疲れた/i, (msg) ->
    words = ["寝ろ", "なんで寝ないの？", "人間がんばればまだいける"]
    msg.send msg.random words
  
  robot.hear /帰りたい/i, (msg) ->
    words = ["とっとと帰れ", "帰ればいいのに"]
    msg.send msg.random words
  
  robot.hear /pit/i, (msg) ->
    words = ["何？またpit in？", "今日も明日もpit in", "あなたとpit。今すぐダウンロード",]
    msg.send msg.random words

  robot.hear /悲しい/i, (msg) ->
    words = ["もっと悲しいことは世の中いっぱいある", "ふーん。で？"]
    msg.send msg.random words

  robot.hear /^はい$/i, (msg) ->
    words = ["返事だけはいいんだね", "ほんとにわかってる？"]
    msg.send msg.random words

  robot.hear /おはよ/i, (msg) ->
    words = [ "いまごろ？", "帰っていいよ"]
    msg.send msg.random words

  robot.hear /idobata-bot/i, (msg) ->
    words = ["よんだ？", "気安く呼ばないでもらえますか"]
    msg.send msg.random words

  robot.hear /？$/i, (msg) ->
    words = ["知らん", "そんなことも分からないの？", "お前は何を言っているんだ"]
    msg.send msg.random words

  robot.hear /二郎/i, (msg) ->
    msg.send "アレは食べ物じゃない"

  robot.hear /misawa/i, (msg) ->
    words = [
      "http://jigokuno.img.jugem.jp/20090522_1213732.gif",
      "http://jigokuno.img.jugem.jp/20090203_875727.gif",
      "http://jigokuno.img.jugem.jp/20100218_1708335.gif",
      "http://jigokuno.img.jugem.jp/20110215_2060227.gif",
      "http://img.jigokuno.com/20120525_2481688.gif",
      "http://jigokuno.img.jugem.jp/20111024_2296936.gif"
    ]
    msg.send msg.random words

  robot.hear /飯|腹減|寿司|食う|食べ/i, (msg) ->
    msg.send ":sushi:"