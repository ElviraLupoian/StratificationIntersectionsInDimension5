// we compute the entire list of closure relations in codimension 1 


load "Dim5ClosureRelations.m";
load "EOStrata.m";
Sdim := [ <a, &+a> : a in S ];


// we for an EO strata of dimension n, we determine all EO strata of dimension n+1 whose Zariski closure contain is 
// we return lists [ i, a, M ] where a is an elementary sequence defining  an EO strata of dimension i, M is the complete list of  elementary sequnces defining EO  strata of dimension i+ 1, whose Zariski closure contains a  
print "Below is the complete list of closure relations in the Ekedahl-Oort stratification in dimension 5";
print " the list <i,a,M>  is to be read as follows";
print " a is an elementary sequence defining an Ekedahl-Oort strata of dimension i";
print "M is the complete list of elementary sequence defining EO strata of dimension i+1, whose Zariski closure contains a";

for i in [0..14] do ;
S1 := [ a[1] : a in Sdim | a[2] eq  i ] ;
S2 := [ a[1] : a in Sdim | a[2] eq i +1];
N := #S1;
for t in [1..N] do ;
a := S1[t] ;
MM := [ b : b in S2 | ClosureRel(a,b) eq 1] ;
<i,a,MM>;
end for ;
end for ;
 
