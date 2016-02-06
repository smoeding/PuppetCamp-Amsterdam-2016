# Create mail aliases
create_resources('mailalias', {
    'postmaster' => { recipient => 'root' },
    'admins'     => { recipient => 'fred,barney' },
  }
)
