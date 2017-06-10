set -eux

export LANG="ja_JP.UTF-8"

#cat /usr/local/texlive/2016/texmf-dist/tex/latex/listings/listings.sty

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


pandoc --template latex.template -V fontsize:14pt -V papersize:b5 -s -f markdown+raw_tex+tex_math_dollars+citations+yaml_metadata_block --filter pandoc-crossref -M "crossrefYaml=crossref_config.yaml" --filter pandoc-citeproc -o target/sweetmusic-vol3.pdf --latex-engine=lualatex -H h-luatexja.tex -A src/imprint.tex -B b-fancy.tex  -B ha-luatexja.tex --toc --toc-depth=1 target/tmp.md --verbose

