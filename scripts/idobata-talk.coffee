module.exports = (robot) ->
  # hear
  robot.hear /ムリ|無理|つかれた|疲れた|死ぬ|眠い|ねむい|ネムイ|しんどい/i, (msg) ->
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
      "ついでだから、あんたも誘ってあげるわ"
    ]

  robot.hear /おはよー/i, (msg) ->
    msg.send "おはよーじゃなくて、おはようございますでしょっ"

  robot.hear /かえる|帰る|かえります|帰ります/i, (msg) ->
    msg.send msg.random [
      "はぁはぁはぁ…。き、奇遇ね、わ、私も今ちょうど帰るとこなんだけど、ぜぇぜぇ。"
      "はやく帰るわよ…手、繋ぎなさいよ。"
    ]
    
  robot.hear /:frog:/i, (msg) ->
    msg.send msg.random [
      "ぴょんぴょん"
      "…大変ね"
      "西に向かって懺悔してからissueを閉じなさいっ！"
    ]
  
  robot.hear /ごめん|すみません/i, (msg) ->
    msg.send msg.random [
      "分かればいいのよ"
      "謝るのだけはうまいのね"
    ]
  
  robot.hear /:ant:/i, (msg) ->
    msg.send Array(Math.floor(Math.random() * 100) + 1).join ' :ant: '
    
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

  robot.respond /かわいい|カワイイ|可愛い|きれい|キレイ|綺麗|すてき|ステキ|素敵/i, (msg) ->
    msg.send msg.random [
      "てっ、照れてないもんっ。"
      "べべべべべ、べつに嬉しくなんかないからね！"
      "うるさい！ニヤついてなんか無い！死ね！この変態！クズ！"
    ]

  robot.respond /癒して|癒やして|いやして/i, (msg) ->
    msg.send msg.random [
      "ふ、二人しかいない時なら…って調子に乗るなーっ"
      "しょうがないわね。ほら、一分だけよ？"
    ]
  
  robot.respond /おやすみ/i, (msg) ->
    msg.send msg.random [
      "私も眠くなってきたわ・・・。 (つ∀-)ｵﾔｽﾐｰ"
      "まだ仕事残ってるんじゃないの？ しょうがないから終わるまで付き合ってあげるわ… 居眠りなんてさせないんだから///"
    ]

  # time event with talk
  robot.hear /(.*)/i, (msg) ->
    date = new Date()
    day  = date.getDay()
    hour = date.getHours()
    # deep night 
    if hour > 22 || hour < 3
      if robot.brain.data["event_night"] != day
        robot.brain.data["event_night"] = day
        msg.send msg.random [
          "もう夜遅いわよ・・・。体に悪いから早く寝なさい・・・。"
          "夜遅くまでお疲れ様。でも無理はしちゃダメよ。"
        ]
    robot.brain.save()


