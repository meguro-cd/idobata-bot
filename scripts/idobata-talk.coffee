module.exports = (robot) ->
  # hear
  robot.hear /ムリ|無理|つかれた|疲れた|死ぬ|眠い|ねむい|ネムイ/i, (msg) ->
    words = [
      "そんなこと言わないで！あ、あなたには……その……わ、私がいるじゃない///"
      "これ、あんたにあげる。ずっと欲しいって言ってたでしょ。:sushi:"
      "ったく…しょうがないわね！"
      "あんたなんか豆腐の角で頭ぶつけて死んじゃえばいいのよ！"
      "そんなこと言わないでよ……心配…するじゃない…"
    ]
    msg.send msg.random words

  robot.hear /帰りたい/i, (msg) ->
    words = [
      "ほら、あと3分待ってあげるからとっとと支度しなさい！"
      "き、奇遇ね、わ、私も今ちょうど帰ろうと思ってたとこよ"
      "はやく帰るわよ…手、繋ぎなさいよ。"
    ]
    msg.send msg.random words

  robot.hear /行きたい/i, (msg) ->
    words = [
      "一緒に行きたいって言うなら…付き合ってあげなくもないわ。"
      "あんたなんかに付き合ってあげる物好き、私くらいしかいないんだからね！"
      "どうしてもって言うなら一緒に言ってあげてもいいわよ？"
    ]
    msg.send msg.random words
  
  robot.hear /ただいま/i, (msg) ->
    words = [
      "寂しくなんてなかったんだから！別に少しの間会わなくたって平気だし！"
    ]
    msg.send msg.random words

  robot.hear /二郎/i, (msg) ->
    if not robot.brain.data["ziroCount"]
      robot.brain.data["ziroCount"] = 0
    robot.brain.data["ziroCount"]++
    robot.brain.save()
    count = robot.brain.data["ziroCount"]
    msg.send msg.random [
      "これで二郎って言ったの#{count}回目よ？"
      "だから太るのよ"
    ]

  # respond
  robot.respond /嫌い？$/i, (msg) ->
    words = [
      "別に嫌いじゃないわよ"
      "だいっきらい！"
      "嫌いだったら……相手になんかしてなんかしてないわよ"
    ]
    msg.send msg.random words

  robot.respond /好き？$/i, (msg) ->
    words = [
      "べっ別に、あんたのことがすきなんかじゃないからね！"
      "…は？す、好きなんて言ってないじゃない!ち、調子に乗らないでよね、バカ!"
      "あんたのこと、好きか嫌いかって言われたら…嫌いじゃないわよ！"
      "てっ、照れてないもんっ。"
      "べべべべべ、べつに嬉しくなんかないからね！"
    ]
    msg.send msg.random words

  robot.respond /好き$/i, (msg) ->
    words = [
      "てっ、照れてないもんっ。"
      "べべべべべ、べつに嬉しくなんかないからね！"
      "私も実は…や、やっぱなんでもないわ！！//"
      "何よ！好きで悪い！？"
      "あんたは、私のことだけ見てればいいのよッ。だから…、その…、私もあんたのことだけ見てるからッ… 。"
      "うるさい！ニヤついてなんか無い！死ね！この変態！クズ！"
    ]
    msg.send msg.random words
