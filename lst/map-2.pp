# Generate Apache aliases from array of path names
$dirs = [
  '/var/www/css',
  '/var/www/gfx',
  '/var/www/js',
  '/usr/lib/cgi-bin',
]

$aliases = map($dirs) |$d| {
  # Extract last component of path including '/'
  $alias = regsubst($d, '^.*(/[^/]+/?)$', '\1')

  # Return a hash
  { path => $d, alias => $alias, }
}
