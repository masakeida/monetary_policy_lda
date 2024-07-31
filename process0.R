library(dplyr)
library(RMeCab)

#docnum <- 70;
docnum <- 44;

res0 <- docDF("./text", type=1, N=1);
res1 <- res0 %>% filter(POS1 %in% c("名詞", "動詞")) %>% filter(POS2 %in% c("サ変接続", "一般", "形容動詞語幹", "固有名詞", "自立", "数"));

res1_dup_terms <- res1[duplicated(res1$TERM),1];

for (i in 1:length(res1_dup_terms)) {
    duprows <- grep(paste("^", res1_dup_terms[i], "$", sep=""), res1$TERM);
    t_TERM <- unique(res1[duprows, 1]);
    if (length(t_TERM) > 1) {
        t_TERM <- paste(unique(res1[duprows, 1]), collapse="+");
    }
    t_POS1 <- unique(res1[duprows, 2]);
    if (length(t_POS1) > 1) {
        t_POS1 <- paste(unique(res1[duprows, 2]), cpllapse="+");
    }
    t_POS2 <- unique(res1[duprows, 3]);
    if (length(t_POS2) > 1) {
        t_POS2 <- paste(unique(res1[duprows, 3]), collapse="+");
    }
    newline <- apply(res1[duprows, 4:docnum+3], 2, sum);

    for (i in duprows) {
        res1[i, 1] <- t_TERM;
        res1[i, 2] <- t_POS1;
        res1[i, 3] <- t_POS2;
        res1[i, 4:docnum+3] <- newline;
    }
}

res2 <- res1 %>% distinct(TERM, .keep_all=T);

write.table(res2, "./resource.txt", col.names=T, row.names=F, sep="\t", quote=F, append=F);
