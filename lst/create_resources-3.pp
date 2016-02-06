# Our mail aliases
$aliases = { 'postmaster' => 'root', 'admins' => 'fred,barney' }

# Convert key-values into strings
$aliases_1 = join_keys_to_values($aliases, ':')

# Build JSON key-value pairs
$aliases_2 = regsubst($aliases_1, '^(.*):(.*)$', '"\1": {"recipient": "\2"}')

# Concatenate into one string
$aliases_3 = join($aliases_2, ', ')

# Finalize JSON representation
$aliases_4 = "{ ${aliases_3} }"

# Convert into a Puppet hash
$aliases_5 = parsejson($aliases_4)

create_resources('mailalias', $aliases_5)
