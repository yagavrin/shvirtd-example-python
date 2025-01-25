!/bin/bash
DUMP_NAME="dump-$(date +"%d.%m.%y-%H.%M.%S").sql"

if [ -f "$HOME/db.conf" ]; then
   . $HOME/db.conf
else
   echo "file db.conf not found"
   exit 1
fi \
&& mkdir -p /opt/backup \
&& docker run --rm --network shvirtd-example-python_backend mysql:8 mysqldump -h$DB_HOST -u$DB_USER -p$DB_PASS $DB_NAME > backup && sudo mv backup /opt/backup/$DUMP_NAME
