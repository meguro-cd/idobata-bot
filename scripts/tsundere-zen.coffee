
module.exports = (robot) ->
  robot.respond /(zen)|禅$/i, (msg) ->
    msg
      .http("https://api.github.com/zen")
      .get() (err, res, body) ->
        msg.send msg.random [
          "#{body}っていうじゃない"
          "#{body}って聞いたことないの？"
          "一つだけ言っておくわ
          #{body}"
          "しょうがないわね…
          #{body}
          ちゃんと覚えておきなさいよっ！
          "
          "一度しか言わないからよーく聞いてなさいよね
          #{body}"
        ]