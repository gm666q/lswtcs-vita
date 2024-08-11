#!/usr/bin/env bash

for glsl_file in glsl/**/*.glsl
do
  xxh=$(basename "$glsl_file")
  xxh=${xxh%.*}
  profile=$(sed -En 's/\/\/ profile (sce_[fv]p_psp2)/\1/p' "cg/${xxh:0:1}/$xxh.cg")

  printf "\033[0;31m - Compiling %s cg/%s/%s.cg\033[0m\n" "$profile" "${xxh:0:1}" "$xxh"
  mkdir -p "gxp/${xxh:0:1}"
  wine ./psp2cgc.exe -profile "$profile" "cg/${xxh:0:1}/$xxh.cg" -cache -W4 -Wperf -fastprecision -O4 -o "gxp/${xxh:0:1}/$xxh.gxp"
done

#rm -rf gxp/**/*.sdb
