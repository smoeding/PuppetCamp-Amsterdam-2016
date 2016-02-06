# Puppet 4 version
$labels = {
  '::/96'         => 20,
  ...
  '::ffff:0:0/96' => 100,
}

reduce($labels, []) |$memo, $item| {
  # Fail if the current precedence has been seen before
  if member($memo, $item[1]) {
    fail("${item[0]} has non-unique value ${item[1]}")
  }

  # Add precedence to list of processed items
  concat($memo, $item[1])
}
