module.exports = (robot) ->
  robot.hear /opened pull request/i, (msg) ->
    words = [
      "修正してくれたの？…お、お礼なんて言わないんだからねっ！"
      "早くマージしなさいよ！ほら、早く！"
      "いい修正ね！褒めてあげる"
      "一度しか言わないからよーく聞きなさいよっ！……ありがと"
    ]
    msg.send msg.random words

  robot.hear /merged pull request/i, (msg) ->
    words = [
      "かっ、勘違いしないでよねっ！！///嬉しくなんてないんだからっ！"
      "も、もしちょっとの間私が反応しなくても怒らないでよね…//"
      "わかってるじゃない。褒めてあげる"
      ":heart:"
    ]
    msg.send msg.random words