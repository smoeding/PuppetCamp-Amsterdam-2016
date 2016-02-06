# Array of filenames
$files = [ '/dir/file1', '/dir/file2', ... ]

# Declare multiple resources by using an array
file { $files:
  ensure => absent,
}
