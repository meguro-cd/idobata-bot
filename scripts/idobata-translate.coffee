validLangs = 
  ja: '日本語'
  en: '英語'
  vi: 'ベトナム語'

# <言語名>translateComments <翻訳結果>
translateComments = [
  'へ翻訳して欲しいのね。今回だけよ。\n'
  'の辞書持ってるから翻訳してあげるわ。\n'
  'へ翻訳するわ。\n'
]

module.exports = (robot) ->
  #  翻訳する
  robot.hear /(.*)-(.*)/i, (msg) ->
    url = getTranslateUrl(msg.match[1], msg.match[2].trim())
    if (url == false)
      return
    msg.http(url)
    .get() (err, res, body) ->
      msg.send msg.send validLangs[msg.match[2]] + msg.random(translateComments) + body
  
  # 一つ前の発言を翻訳する
  robot.hear /(.*)/i, (msg) ->
    if !isValidLang(msg.match[1])
      return
    url = getTranslateUrl(robot.brain.data['prevWord'], msg.match[1])
    msg.http(url)
    .get() (err, res, body) ->
      msg.send validLangs[msg.match[1]] + msg.random(translateComments) + body

  # 一個前のワードを覚えておく
  robot.hear /(.*)/i, (msg) ->
    text = msg.match[1]
    robot.brain.data['prevWord'] = text
    robot.brain.save()

  # TODO: ヘルプを表示する


  # 関数
  # 翻訳先が正しい指定か調べる
isValidLang = (lang) ->
  for key, val of validLangs
    if key == lang
      return true
  return false

getTranslateUrl = (src, lang) ->
  text = encodeURIComponent src
  to = lang
  if !isValidLang(to)
    return false
  url = "http://iruseira-c.cloudapp.net/translate.php?text="+text+"&to="+to
  return url

