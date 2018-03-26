#!/bin/bash

# First sync =======================================================================
  repo sync -c -f -j64 --force-sync --no-clone-bundle --no-tags;

# Then rebase ======================================================================
  deadly="https://github.com/deadlyindian";
  dcaf="/DirtyUnicorns-O-caf";
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
  git pull $deadly/android_frameworks_base o8x --rebase;
  croot;

  echo " ";
  echo -e "\e[1;32mRebasing packages/apps/Dialer...\e[0m";
  cd packages/apps/Dialer;
  git pull $fab/packages_apps_Dialer oreo-mr1 --rebase;
  croot;

  echo " ";
  echo -e "\e[1;32mRebasing system/core...\e[0m";
  cd system/core;
  git pull $deadly$dcaf system_core --rebase;
  croot;

  echo " ";
  echo -e "\e[1;32mRebasing frameworks/av...\e[0m";
  cd frameworks/av;
  git pull $deadly$dcaf frameworks_av --rebase;
  croot;

  echo " ";
  echo -e "\e[1;32mRebasing system/media...\e[0m";
  cd system/media;
  git pull $deadly$dcaf system_media --rebase;
  croot;

  echo " ";
  echo -e "\e[1;32mRebasing system/vold...\e[0m";
  cd system/vold;
  git pull $deadly$dcaf system_vold --rebase;
  croot;

  echo " ";
  echo -e "\e[1;32mRebasing system/sepolicy...\e[0m";
  cd system/sepolicy;
  git pull $deadly$dcaf system_sepolicy --rebase;
  croot;

  echo " ";
  echo -e "\e[1;32mRebasing vendor/du...\e[0m";
  cd vendor/du;
  git pull $deadly$dcaf vendor_du --rebase;
  croot;

  echo " ";
  echo -e "\e[1;32mRebasing packages/apps/Settings...\e[0m";
  cd packages/apps/Settings;
  git pull $deadly$dcaf packages_apps_Settings --rebase;
  croot;

  echo " ";
  echo -e "\e[1;32mRebasing packages/apps/DU-Tweaks...\e[0m";
  cd packages/apps/DU-Tweaks;
  git pull $deadly$dcaf packages_apps_DU-Tweaks --rebase;
  croot;
# ===================================================================================
