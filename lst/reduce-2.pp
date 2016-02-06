# Puppet 3 version
$labels = {
  '::/96'         => 20,
  '2002::/16'     => 30,
  '::/0'          => 40,
  '::1/128'       => 50,
  '::ffff:0:0/96' => 100,
}

# Get hash values as array
$priorities = values($labels)

# Check non-unique values
if size(unique($priorities)) < size($priorities) {
  fail('Precedence values are not unique')
}
