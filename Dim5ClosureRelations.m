// we determine the closure relations in the EO stratification in dimension 5 

// we first compute the Weyl group elements corresponding to an elementary sequence

// we define the Weyl group:


S := SymmetricGroup(10) ;
a1 := S ! [2,1,3,4,5,6,7,8,10,9];
a2 := S ! [1,3,2,4,5,6,7,9,8,10];
a3 := S ! [1,2,4,3,5,6,8,7,9,10];
a4 := S ! [1,2,3,5,4,7,6,8,9,10];
a5 := S ! [1,2,3,4,6,5,7,8,9,10];

W := sub<S | [a1,a2,a3,a4,a5]>;  // the Weyl group 
W0 := sub< W | [a1,a2,a3,a4]>;   // the subgroup of the Weyl group required to check closure relations
w0 := W0 ! [5,4,3,2,1,10,9,8,7,6] ; // the marked element of the Weyl group required to check closure relations


// function Weylel computes the Weyl group element:
// input : an elementary sequence - as a tuple of 5 numbers 
// output: a tuple of 10 elements representing an element of S10, ie w = [a1,...a10] represents the element of the Weyl group w, w[i] = ai

 
Weylel := function(e) ;
e := Eltseq(e) ;
S1e := [] ;
if e[1] eq 0 then 
S1e[1] :=  1 ;
end if ;
S1 := [] ;
S1 := [ i : i in [2..5] | e[i] eq e[i-1]];
S1 := S1e cat S1;
S2 := [ i : i in [1..5] | i notin Set(S1)] ;
w := [] ;
for i in [1..5] do ;
if i in S1 then
t := [ j : j in [1..#S1] | S1[j] eq i] ;
w[i] := t[1] ;
else
tt := [ j : j in [1..#S2] | S2[j] eq i ] ;
w[i] := tt[1] + 5 ;
end if ;
end for ;
for i in [6..10] do;
w[i] := 11 - w[11-i];
end for ;
return w;
end function;


// given two elementary sequence e1, e2 we determine whether the EO strata defined by e1 is contained in the Zariski closure of the EO strata defined by e2
// the function ClosureRel determines this 
// input : elementary sequences e1 and e2 
// output: 0 if the EO strata defined by e1 is not contained in the closure of the EO strata defined by e2 and 1 otherwise  


ClosureRel := function(e1, e2) ;
e1 := Eltseq(e1);
e2 := Eltseq(e2) ;
trivcheck := [ e2[i] - e1[i] : i in [1..5] ] ; // we check if the Bruhat  relation holds (corresponding to the identity element)
mtrivcheck := Minimum(trivcheck);
if mtrivcheck ge 0 then ;
return  1;
else 
w1 := Weylel(e1) ;
w2 := Weylel(e2);
S := SymmetricGroup(10) ;
a1 := S ! [2,1,3,4,5,6,7,8,10,9];
a2 := S ! [1,3,2,4,5,6,7,9,8,10];
a3 := S ! [1,2,4,3,5,6,8,7,9,10];
a4 := S ! [1,2,3,5,4,7,6,8,9,10];
a5 := S ! [1,2,3,4,6,5,7,8,9,10];
W := sub<S | [a1,a2,a3,a4,a5]>; 
W0 := sub< W | [a1,a2,a3,a4]>; 
w0 := W0 ! [5,4,3,2,1,10,9,8,7,6] ;
W0 := Set(W0); 
W0 := SetToSequence(W0) ;
w1 := W ! w1;
w2 := W ! w2 ;
SS1 := [ u*w1*(w0*u*w0) : u in W0] ;
S1 := [ Eltseq(a) : a in SS1] ;
b := Eltseq(w2) ;
bs := [ [b[i] : i in [1..n]] : n in [1..10] ] ;
bm := [ Maximum(bs[i]) : i in [1..10] ] ;
S1s := [] ;
for i in [1..120] do ;
a := S1[i] ;
as := [ [a[j] : j in [1..n]] : n in [1..10] ];
asm := [ Maximum(as[i]) : i in [1..10] ] ;
S1s[i] := asm ;
end for;
 SS1 := [  [ bm[k] - S1s[j][k] : k in [1..10] ] : j in [1..120] ] ;
SS1m := [ Minimum(a) : a in SS1] ;
SS1my := [ a : a in SS1m | a ge 0 ] ;
if  SS1my eq [] then;
return 0 ;
else  
return 1 ;
end if ;
end if ;
end function ;

