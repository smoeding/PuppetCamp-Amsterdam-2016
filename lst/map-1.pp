# Scramble mail addresses
$mail = 'fred@example.com'

$s = map($mail) |$char| {
  # Use selector expression to substitute characters
  $char ? {
    '@'     => ' at ',
    '.'     => ' dot ',
    default => $char,
  }
}

$scrambled_mail = join($s)
