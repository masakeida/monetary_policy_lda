-*- markdown -*-

# monetary_policy_lda

The code for 慶田 (2023),

https://www.jeri.or.jp/survey/%e6%a4%8d%e7%94%b0%e6%96%b0%e7%b7%8f%e8%a3%81%e3%81%ae%e9%87%91%e8%9e%8d%e6%94%bf%e7%ad%96%e3%81%ae%e8%a1%8c%e6%96%b9/

The code for Keida and Takeda (2019),

https://www.rieti.go.jp/jp/publications/summary/19050015.html

Please see

https://github.com/masakeida/monetary_policy_lda/tree/rel_2019

## Usage

In shell environment, make text files from PDF Documents in the `./origText` directory.

    % ./mkText.sh

In R environment, run two programs, process0.R and lda.R .

    > source("process0.R")
    > source("lda.R")

### UNIX environment

The authors used the code in FreeBSD 12.x-RELEASE with following software.

* xpdf (for Japanese, you need Language Support Packages: xpdf-japanese.tar.gz and settings)
* perl
* MeCab
* R
  * dplyr, RMeCab, topicmodels, tm, lda