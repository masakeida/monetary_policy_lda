#!/bin/sh

. fileList.sh

for file in ${file_list}
do
    /usr/local/libexec/xpdf/pdftotext ./origText/${file}.pdf
    cat ./origText/${file}.txt | ./delNewPage.sh > ./text/${file}_fmt.txt
done
