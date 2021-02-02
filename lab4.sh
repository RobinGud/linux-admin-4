#!/bin/bash

# Task 1
yum groupinstall "Development tools"

# Task 2
tar -xvf bastet-0.43.tgz 
cd bastet-0.43 
yum install boost-devel
yum install ncurses-devel ncurses
make && make install
bastet

# Task 3
yum list installed » task3.log

# task 4
yum deplist gcc » task4.log

# task 5
mkdir /root/localrepo && cp checkinstall-1.6.2-3.e16.1.x86_64.rpm /root/localrepo/ && createrepo —database /root/localrepo && echo -e "[localrepo]\nname=localrepo\nbaseurl=file:///root/localrepo\nenabled=1\ngpgcheck=0" » /etc/yum.repos.d/localrepo.repo

# task 6
yum repolist enabled » task6.log

# task 7
cd /etc/yum.repos.d/ && for filename in $(ls | grep -v localrepo.repo); do mv "$filename" "$filename.broken"; done; && yum clean all && yum list available

# task 8
cd /home/user && alien -r fortunes-ru_1.52-2_all.deb && rpm -i —force fortunes-ru-1.52-3.noarch.rpm

# task 9
dnf download --source nano
mkdir newnano
cd newnano
rpm2cpio ~/nano-2.9.8-1.el8.x86_64.rpm | cpio -idmv
tar -xvzf nano-2.9.8.tar.gz

# change everything from nano -> newnano
# especially filenames (!)
# automake change required version from 1.15 to 1.16 (ignore warning)
# remove newnano.info list (idk why it doesn't copy to buildroot)

rpmbuild -bb newnano.spec
yum install <path-to-rpm>