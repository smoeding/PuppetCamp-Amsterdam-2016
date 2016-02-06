# Consecutive numbers are on opposite sides of a dice
$dice = [ '1', '6', '2', '5', '3', '4', ]

slice($dice, 2) |$num1, $num2| {
  notice("${num1} is opposite of ${num2}")
}
