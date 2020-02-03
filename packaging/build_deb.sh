#!/bin/bash

echo "======================"
echo "Getting version"
echo "======================"

PYPKG_NAME="ezdxf"
VSTRING=$( python3 packaging/get_ezdxf_version.py )
echo "VSTRING: ${VSTRING}"
DEB_VERSION=$( git rev-list --all --count )
echo "DEB_VERSION: ${DEB_VERSION}"

echo "======================"
echo "Modifying stdeb.cfg"
echo "======================"

LSB_RELEASE=$( lsb_release -rs )
sed -e "s/Debian-Version:/Debian-Version: ${DEB_VERSION}/" ./packaging/stdeb.cfg.in | sed -e "s/suite:/suite: ${LSB_RELEASE}/" > ./stdeb.cfg

echo "======================"
echo "Building package"
echo "======================"

rm -rf deb_dist
python3 ./setup.py --command-packages=stdeb.command sdist_dsc --suite="${LSB_RELEASE}"

NAME=$( echo "${PYPKG_NAME}" | sed -e "s/_/-/")
pushd ./deb_dist/${NAME}-${VSTRING}
debuild
popd
