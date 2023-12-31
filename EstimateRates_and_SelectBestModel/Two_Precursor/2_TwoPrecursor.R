library(corHMM)
Tips <- c("Sp1","Sp2","Sp3")
State <- c("Nodulating","Non-nodulating","?")
Data <- cbind(Tips,State)
RateClassMat <- getRateCatMat(2)
RateCat1 <- getStateMat4Dat(Data)$rate.mat
RateCat2 <- getStateMat4Dat(Data)$rate.mat
#Make it so that rate cat 3 is the one that can't gain nodulation, remove 1 --> 2
RateCat2[3] <- 0
StateMats <- list(RateCat1, RateCat2)
HR3.precursorish.FullMat <- getFullMat(StateMats, RateClassMat)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../Nitfix.tree.v7.tree")
TwoPrecursor.NUM <- corHMM(tree,tipstate_matrix,2,rate.mat=HR3.precursorish.FullMat,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=CUSTOM,nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/AncPres.TwoPrecursor.NUM.RData")
