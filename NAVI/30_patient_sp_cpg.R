B<-readRDS("/Users/wone/CSI/vivek/nevi/beta_48samples.RDS")
M=log(B/(1-B))
Mstd=(M-apply(M,1,mean))/apply(M,1,sd)

           Type = c("Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                     "Melanoma","MIS","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Nevi","Melanoma","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi")

Mstd.nevi = Mstd[ , Type!="Melanoma" ]
Mstd.melanoma = Mstd[ , Type=="Melanoma" ]

Dstd=(Mstd.nevi - Mstd.melanoma)^2
Stat=apply(Dstd,1,sum)
order.Stat=rev(order(Stat))
chosen.cpgs=order.Stat[1:round(length(order.Stat)*.25)]
tokeep = order.Stat[round(length(order.Stat)*.25):dim(B)[1]]
