#!/usr/bin/env bash

#set -e

# TODO: remember to check syssoftware if it exist in package manager, if not offer alternative or custom installation
# TODO: remember to check syssoftware versions, if too low then offer alternative installation from web/git/etc.

##############
# PREINSTALL #
##############

readonly FONTSRC=fonts
readonly FONTDEST=~/.fonts
readonly SETUPSRC=setup
readonly PREINSTALL="${SETUPSRC}/preinstall.sh"
readonly SYSSOFT="${SETUPSRC}/syssoftlist"
readonly CUSTOMSOFT="${SETUPSRC}/custominstall.sh"


# discover and initialize the operating system name and version variables
if [ -f /etc/os-release ]; then
  # freedesktop.org and systemd
  . /etc/os-release
  OSNAME=$NAME
  OSVER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
  # linuxbase.org
  OSNAME=$(lsb_release -si)
  OSVER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
  # For some versions of Debian/Ubuntu without lsb_release command
  . /etc/lsb-release
  OSNAME=$DISTRIB_ID
  OSVER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
  # Older Debian/Ubuntu/etc.
  OSNAME=Debian
  OSVER=$(cat /etc/debian_version)
elif [ -f /etc/Suse-release ]; then
  # Older Suste/etc.
  # TODO: finish this - find
  echo "skip"
elif [ -f /etc/redhat-release]; then
  # Older Red Hat, CentOS, etc
  # TODO: finish this - find
  echo "skip"
else
  # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
  OSNAME=$(uname -s)
  OSVER=$(uname -r)
fi

err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
  exit 1
}

# discover and initialize package manager name and functionality
echo "Searching for package manager . . ."
# PKGMNGR=""
declare -a PKGMNGRS=(aptitude apt apt-get rpm)
for pkg in "${PKGMNGRS[@]}"; do
  if type $pkg >/dev/null 2>&1; then
    PKGMNGR="$pkg"
    break
  fi
done

if [ -n "$PKGMNGR" ]; then
  echo "Found package manager on system: $PKGMNGR" 
else
  err "Abort, didn't found package manager on system."
fi
# use switch case in order to implement factory function for pkg install



validate_file() {
  [ ! -e $1 ] && err "$1 file is missing. Aboring installation . . ."
}

validate_files() {
  echo "Validating files . . ."
  for arg in "$@"; do
    validate_file $arg
  done
}

install_fonts() {
  echo "Installing fonts . . ."
  [ ! -e "$FONTDEST" ] && mkdir "$FONTDEST"
  cp -auv "$FONTSRC/." "$FONTDEST/"
  fc-cache -fv
}

# implement specific pkg install
abs_install_single_sys_package() {
  printf "$app: "
  if dpkg -s "${app}" 1>/dev/null 2>&1 ; then
    echo "[installed]"
  else
    echo "[NO]"
  fi
}

install_all_sys_packages() {
  i=0
  while IFS="" read -r app || [ -n "$app" ]; do
    abs_install_single_sys_package $app
    i=$((i+1))
  done < $SYSSOFT
}

main() {
  echo "Starting the installation. . ."
#  validate_files $FONTSRC $PREINSTALL $SYSSOFT $CUSTOMSOFT
#  install_fonts
#  install_all_sys_packages
}

main

#chmod a+x "$PREINSTALL"
#./"$PREINSTALL"


###########################
# INSTALL SYSTEM SOFTWARE #
###########################
# install fonts
# install apt software from provided list

#cat "$SYSSOFT" | xargs sudo apt install -y


###########################
# INSTALL CUSTOM SOFTWARE #
###########################

#chmod a+x "$CUSTOMSOFT"
#./"$CUSTOMSOFT"

