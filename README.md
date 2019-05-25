-*- markdown -*-

# monetary_policy_lda

## Usage

* Make text files from PDF Documents in the origText directory.

    % ./mkText.sh

* In R environment, run two programs, process0.R and lda.R .

    > source("process0.R")
    > source("lda.R")

###UNIX environment

The authors used FreeBSD 11.1-RELEASE and followings.

* xpdf (for Japanese, you need Language Support Packages: xpdf-japanese.tar.gz and settings)
* perl
* python 2.7
* MeCab
* R
  * dplyr, RMeCab, topicmodels, tm, lda