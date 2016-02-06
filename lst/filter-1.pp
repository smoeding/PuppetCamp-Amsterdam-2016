# Get hash of interfaces from the networking fact
$ifaces = $::networking['interfaces']

# Network facts for our internal interfaces only
$net = filter($ifaces) |$ifname, $attr| {
  $attr['ip'] =~ /^192\.168/
}
