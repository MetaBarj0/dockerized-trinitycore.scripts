#/bin/sh

function createSSHFiles() {
  local ssh_dir="$(
    gdbmtool -r /home/docker/kvstore.db << EOF
      fetch ssh_dir
EOF
  )"

  [ -z "$ssh_dir" ] && return 1

  if [ ! -d "$ssh_dir" ]; then
    error "The directory $ssh_dir does not exist. SSH key secrets cannot be created as they should be."
    return 1
  fi

  if [ ! -f "${ssh_dir}/id_rsa.pub" ]; then
    error "Cannot find the file ${ssh_dir}/id_rsa.pub. Public key secret cannot be created as it should be."
    return 1
  fi

  if [ ! -f "${ssh_dir}/id_rsa" ]; then
    error "Cannot find the file ${ssh_dir}/id_rsa. Secret key secret cannot be created as it should be."
    return 1
  fi

  mkdir /home/tc/.ssh

  cp "${ssh_dir}/id_rsa.pub" "/home/docker/ssh/id_rsa.pub"
  cp "${ssh_dir}/id_rsa" "/home/docker/ssh/id_rsa"

  chown tc:tc /home/tc/.ssh && chmod 0700 /home/tc/.ssh
  chown tc:tc /home/tc/.ssh/* && chmod 0600 /home/tc/.ssh/id_rsa*
}

createSSHFiles