# Reverse a sentence
$sentence = 'Strawberry Fields Forever'

$reverse = reduce($sentence, '') |$memo, $c| {
  "${c}${memo}"
}
