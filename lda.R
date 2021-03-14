library(dplyr)
library(topicmodels)
library(tm)
library(lda)

#docnum <- 55;
docnum <- 70;

res3 <- read.table("resource.txt", header=T);
res4 <- res3;
rownames(res4) <- res4$TERM;
res4 <- res4 %>% select(-c(TERM:POS2));
res5 <- as.DocumentTermMatrix(t(res4), weighting= weightTf);
k <- 3;
numtopw <- 20;  # number of top words in topic
model <- LDA(res5, k);
terms(model);

res6 <- topicmodels::dtm2ldaformat(res5);
# comment out the line below, if you need the randomness.
set.seed(123);
result <- lda::lda.collapsed.gibbs.sampler(res6$documents, K = k, res6$vocab, 200000, 0.1, 0.1, compute.log.likelihood=T);
top.words <- lda::top.topic.words(result$topics, numtopw, by.score=T);
print(top.words);
write.table(top.words, "top_words.txt", col.names=F, row.names=F, sep="\t", append=F);

topic.proportions <- t(result$document_sums) / colSums(result$document_sums);
topic.proportions <- as.data.frame(topic.proportions);
rownames(topic.proportions) <- colnames(res4);
colnames(topic.proportions) <- paste("topic", 1:k);
write.table(topic.proportions, "topic_proportions.txt", col.names=T, row.names=T, sep="\t", append=F);
