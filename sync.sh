#!/bin/bash

# First sync =======================================================================
  repo sync -c -f -j64 --force-sync --no-clone-bundle --no-tags;

# Then rebase ======================================================================
  deadly="https://github.com/deadlyindian";
  dosp="/DirtyUnicorns-O";
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
  echo " ";
  cd frameworks/base;
  git pull $deadly/android_frameworks_base o8x --rebase;
  croot;

  echo " ";
  echo -e "\e[1;32mRebasing packages/apps/Dialer...\e[0m";
  echo " ";
  cd packages/apps/Dialer;
  git pull $fab/packages_apps_Dialer oreo-mr1 --rebase;
  croot;
  echo " ";

  echo " ";
  echo -e "\e[1;32mRebasing system/core...\e[0m";
  echo " ";
  cd system/core;
  git pull $deadly$dosp system_core --rebase;
  croot;

  echo " ";
  echo -e "\e[1;32mRebasing system/sepolicy...\e[0m";
  cd system/sepolicy;
  git pull $deadly$dosp system_sepolicy --rebase;
  croot;
# ===================================================================================
