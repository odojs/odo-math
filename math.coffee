decimalAdjust = (type, value, exp) ->
  # If the exp is undefined or zero...
  if typeof exp is 'undefined' or +exp == 0
    return Math[type](value)
  value = +value
  exp = +exp
  # If the value is not a number or the exp is not an integer...
  if isNaN(value) or !(typeof exp is 'number' and exp % 1 == 0)
    return NaN
  # Shift
  value = value.toString().split 'e'
  value = Math[type](+(value[0] + 'e' + (if value[1] then +value[1] - exp else -exp)))
  # Shift back
  value = value.toString().split 'e'
  +(value[0] + 'e' + (if value[1] then +value[1] + exp else exp))

module.exports =
  round10: (value, exp) ->
    decimalAdjust('round', value, exp)
  floor10: (value, exp) ->
    decimalAdjust('floor', value, exp)
  ceil10: (value, exp) ->
    decimalAdjust('ceil', value, exp)