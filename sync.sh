#!/bin/bash

# First sync =======================================================================
  repo sync -c -f -j64 --force-sync --no-clone-bundle --no-tags;

# Then rebase ======================================================================
  deadly="https://github.com/deadlyindian/DirtyUnicorns-O-8x-caf";
  if [ -z "$(type -t croot)" ]; then
    while [ ! -e './build/envsetup.sh' ]; do
      cd ../;
    done;
    source ./build/envsetup.sh;
  fi;
  croot;
  echo " ";

  dir2rebase=(
    system/core
    frameworks/av
    system/media
    system/sepolicy
    vendor/du
    packages/apps/Settings
    build/make
    hardware/libhardware
    hardware/qcom/keymaster
    packages/apps/Dialer
    packages/services/Telephony
    build/soong
    vendor/extras
    frameworks/base
  )

  for d in ${dir2rebase[@]}; do
    cd "$d";
    echo -e "\e[1;32mRebasing "$d"...\e[0m";
    d=$(echo $d | tr '[/]' '_');
    git pull $deadly "$d" --rebase --quiet;
    if [ $? -ne "0" ]; then
      echo "Rebase failed...."
    else
      git checkout -B "$d";
    fi
    echo " ";
    croot;
  done
# ===================================================================================
