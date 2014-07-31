# Forked from hugorodgerbrown. Originally created .rst files
# Now creates .pdfs
#
# This script was created to convert a directory full
# of markdown files into rst equivalents. It uses
# pandoc to do the conversion.
#
# 1. Install pandoc from http://johnmacfarlane.net/pandoc/
# 2. Copy this script into the directory containing the .md files
# 3. Ensure that the script has execute permissions
# 4. Run the script
#
# By default this will keep the original .md file

FILES=*.md
for f in $FILES
do
  # extension="${f##*.}"
  filename="${f%.*}"
  echo "Generating website"
  jekyll build
  echo "Converting $f to #filename.docx"
  `pandoc -s -S --latex-engine=xelatex --filter pandoc-citeproc $f -o typeset_drafts/$filename.docx`
  echo "Converting $f to $filename.pdf"
  `pandoc -s -S --latex-engine=xelatex --filter pandoc-citeproc $f -o typeset_drafts/$filename.pdf`
done