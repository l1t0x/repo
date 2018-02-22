#!/bin/sh
apt-ftparchive packages ./debs > ./Packages
sed -i -e '/^SHA/d' ./Packages
bzip2 -c9k ./Packages > ./Packages.bz2
printf "Origin: charlie505\nLabel: charlie505\nSuite: stable\nVersion: 6.9\nCodename: ios\nArchitecture: iphoneos-arm\nComponents: main\nDescription: My personal repo.\nIcon: CydiaIcon.png\nMD5Sum:\n "$(cat ./Packages | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages --printf="%s")" Packages\n "$(cat ./Packages.bz2 | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages.bz2 --printf="%s")" Packages.bz2\n" >Release;
exit 0
