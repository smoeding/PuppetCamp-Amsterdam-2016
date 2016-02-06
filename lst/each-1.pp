# Array of filenames
$files = [ '/dir/file1', '/dir/file2', ... ]

# Declare multiple resources by using a loop
each($files) |$file| {
  file { $file:
    ensure => absent,
  }
}
