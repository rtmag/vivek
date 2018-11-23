

multiIntersectBed -i 1_CD41+_tr_over_CD41+_untr.bed 1_CD41+_untr_over_CD41+_tr.bed 2_CD41-_tr_over_CD41-_untr.bed 2_CD41-_untr_over_CD41-_tr.bed 3_CD41+_untr_over_CD41-_untr.bed 3_CD41-_untr_over_CD41+_untr.bed 4_CD41+_tr_over_CD41-_tr.bed 4_CD41-_tr_over_CD41+_tr.bed|grep -P '\t2\t' |cut -f5|sort|uniq -c|sort -n

library(VennDiagram)

###TF only 
#read file
multi_bed<-read.table("multiIntersect_output_TF5.bed",header=T,stringsAsFactors=F)

#formating
list.multi<-list(CEBPb=which(multi_bed$CEBPb==1),JUND=which(multi_bed$JUND==1))

#set venn;  i'll explain the parameters:
#Fill Vector with colors,
#alpha is how transparent do you want the colors
#cex the size of the numbers,
#lty the type of line 2 is dashed, 1 is full. other numbers are funny :P
#cat.cex is the TF name size
#margins is to play with the margins, if not specified the plot might get truncated
vp <- venn.diagram(list.multi,fill=c("red", "green"), alpha = .4, 
cex = .8,lty =2,cat.cex=.7, filename = NULL,margin=.1)
#plotting
grid.draw(vp)
