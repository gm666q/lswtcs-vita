#!/usr/bin/env bash

for glsl_file in glsl/*.glsl
do
  sha=$(basename "$glsl_file")
  sha=${sha%.*}
  profile=$(sed -En 's/\/\/ profile (sce_[fv]p_psp2)/\1/p' "cg/$sha.cg")

  printf "\033[0;31m - Compiling %s cg/%s.cg\033[0m\n" "$profile" "$sha"
  wine ./psp2cgc.exe -profile "$profile" "cg/$sha.cg" -cache -W4 -Wperf -fastprecision -O4 -o "gxp/$sha.gxp"
done

#rm -rf gxp/*.sdb
