# Java packages we want to manage
$java = [
  { packages     => [ 'ibm-java7-jdk:s390', ],
    java_version => '1.7',
    java_bitness => '32bit',
    architecture => [ 's390', ],
    os_rel       => [ 'Debian-7', ],
  },
  { packages     => [ 'openjdk-7-jdk', ],
    java_version => '1.7',
    java_bitness => '64bit',
    architecture => [ 's390x', 'amd64' ],
    os_rel       => [ 'Debian-7', 'Ubuntu-14.04', ],
  },
  ...
]

# Combined os-release fact: 'Ubuntu-14.04', 'Debian-7'
$os_rel = "${::os['name']}-${::os['release']['major']}"

# Filter inappropriate options
$candidates = filter($java) |$hash| {
  ($java_version   == $hash['java_version']) and
  ($java_bitness   == $hash['java_bitness']) and
  ($::architecture in $hash['architecture']) and
  ($os_rel         in $hash['os_rel'])
}

if empty($candidates) {
  fail("No appropriate Java JDK available")
}

# Priority: first candidate wins
ensure_packages($candidates[0]['packages'])
