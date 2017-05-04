set -eux

rm -rf target
mkdir -p target

OUTPUT="sweetmusic-vol3"

for file in `ls src/*.md`
do
  cat $file >> target/tmp.md
  cat src/newpage.txt >> target/tmp.md
done
cat src/*.yaml >> target/tmp.md

cat -n target/tmp.md

pandoc -V fontsize:14pt -V papersize:b5 -f markdown+raw_tex+tex_math_dollars+citations+yaml_metadata_block --filter pandoc-citeproc -o target/${OUTPUT}.pdf --latex-engine=lualatex -H h-luatexja.tex -A src/imprint.tex -B b-fancy.tex  --toc --toc-depth=1 target/tmp.md

