#!/bin/bash

mkdir -p /usr/local
cd /usr/local
git clone https://github.com/samop/OET1.git
#vse izvrsne datoteke v bin direktorij.
cp /usr/local/OET1/scripts/*.sh /usr/local/bin;
#init.d skripte v /etc
cp /usr/local/OET1/init.d/oet1 /etc/init.d;
chmod a+x /etc/init.d/oet1;
#nadgradnja rc.d pravil.
ln -s /etc/init.d/oet1 /etc/rc2.d/S99oet1
ln -s /etc/init.d/oet1 /etc/rc3.d/S99oet1
ln -s /etc/init.d/oet1 /etc/rc0.d/S99oet1
ln -s /etc/init.d/oet1 /etc/rc1.d/S99oet1
