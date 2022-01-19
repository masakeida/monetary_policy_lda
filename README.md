-*- markdown -*-

# monetary_policy_lda

The code for Keida and Takeda (2019),
https://www.rieti.go.jp/jp/publications/summary/19050015.html

## Usage

In shell environment, make text files from PDF Documents in the `./origText` directory.

    % ./mkText.sh

In R environment, run two programs, process0.R and lda.R .

    > source("process0.R")
    > source("lda.R")

### UNIX environment

The authors used the code in FreeBSD 11.1-RELEASE with following software.

* xpdf (for Japanese, you need Language Support Packages: xpdf-japanese.tar.gz and settings)
* perl
* MeCab
* R
  * dplyr, RMeCab, topicmodels, tm, lda