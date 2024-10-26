#!/usr/bin/env sh

export PYTHONWARNINGS=ignore
export PIP_ROOT_USER_ACTION=ignore
do_sleep=${DO_SLEEP:-"1d"}
src_dir=${LE_DIR:-"/etc/letsencrypt"}
#dest_dir=${CERT_DIR:-"/certbot"}

#sync_certs(){
#  local src=$1
#  local dest=$2
#  echo "$(date) Syncing certs from ${src} to ${dest}"
#  rsync -avqn "${src}" "${dest}"
#}

#if [ ! -e "$src_dir" ]
#then
#  sync_certs "${dest_dir}/letsencrypt/" "${src}/"
#fi

while true
do
  echo "$(date) Updating tools"
  pip install --upgrade certbot certbot-dns-linode 1>/dev/null
  echo "$(date) Attempting renew"
  certbot renew -q --dns-linode --dns-linode-credentials /etc/letsencrypt/linode-creds.cfg
  #sync_certs "${src_dir}" "${dest_dir}"
  echo "$(date) Resting for $do_sleep"
  sleep $do_sleep
done
