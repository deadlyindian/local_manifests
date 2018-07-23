#!/bin/bash

# First sync =======================================================================
  repo sync -c -f -j64 --force-sync --no-clone-bundle --no-tags;

# Then rebase ======================================================================
  deadly="https://github.com/deadlyindian";
  dcaf="/DirtyUnicorns-O-8x-caf";
  fab="https://github.com/Fabulous-Oreo";
  if [ -z "$(type -t croot)" ]; then
    while [ ! -e './build/envsetup.sh' ]; do
      cd ../;
    done;
    source ./build/envsetup.sh;
  fi;
  croot;
 
  echo " ";
  echo -e "\e[1;32mRebasing frameworks/base...\e[0m";
  cd frameworks/base;
  git pull $deadly/android_frameworks_base o8x --rebase --quiet;
  if [ $? -ne "0" ]; then
    echo "Rebase failed...."
  fi;
  croot;

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
  )

  for d in ${dir2rebase[@]}; do
    cd "$d";
    echo " ";
    echo -e "\e[1;32mRebasing "$d"...\e[0m";
    d=$(echo $d | tr '[/]' '_');
    git pull $deadly$dcaf "$d" --rebase --quiet;
    if [ $? -ne "0" ]; then
      echo "Rebase failed...."
    fi;
    croot;
  done
# ===================================================================================
