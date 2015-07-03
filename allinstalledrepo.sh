#!/bin/bash

# Create repo of all installed packages in current directory. Assumes RHEL-family Linux,
# with packages yum-utils and createrepo installed.

yum list installed | cut -d " " -f 1 | while read pkgname;
do
  yumdownloader --resolve $pkgname;
done

createrepo --database .
