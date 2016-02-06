# Tidy using retention time based on the directory name
$directories = [ '/tmp', '/var/tmp', '/opt/jboss/log', ]

each($directories) |$dir| {
  $age = $dir ? {
    /tmp/   => '1d',
    /log/   => '4w',
    default => '1w',
  }

  tidy { $dir:
    age    => $age,
    backup => false,
  }
}
