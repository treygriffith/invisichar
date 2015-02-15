class Converter
  constructor: (@set) ->
  from: (idx, toNums) ->
    if toNums
      @set[idx]
    else
      idx
  to: (idx, toNums) ->
    @from(idx, !toNums)
  toNums: (chars) ->
    @convert(chars, true)
  toSet: (chars) ->
    @convert(chars)
  convert: (chars, toNums) ->
    for idx in [0...@set.length]
      chars = chars.replace(new RegExp("#{@from(idx, toNums)}", "g"), "#{@to(idx, toNums)}")
    chars

class Invisichar
  constructor: (set) ->
    set ||= ["\uFEFF", "\u200B", "\u200C", "\u200D"]
    @converter = new Converter(set)
  fromString: (str) ->
    [0...str.length].map( (idx) =>
      charCode = str.charCodeAt(idx)
      @converter.toSet(@zeroPad(charCode.toString(4), 4))
    ).join("")
  toString: (base4) ->
    String.fromCharCode.apply(String, @converter.toNums(base4).match(/.{1,4}/g).map (char) ->
      parseInt(char, 4)
    )
  zeroPad: (n, length) ->
    n = n.toString()
    if n.length == length
      n
    else
      @zeroPad("0#{n}", length)

module.exports = new Invisichar()
module.exports.Invisichar = Invisichar
