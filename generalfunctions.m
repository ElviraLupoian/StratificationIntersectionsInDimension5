// stretch an  elementary sequence to a final sequence

fseq := function(t) ;
b := t ;
n := #t;
for i in [1..n] do ;
b[2*n -i] := n -i + t[i] ;
end for;
b[2*n] := n;
return b ;
end function;

// the functions required to  add elementary sequences

// the assooiated delta function 

delta := function(a) ; // input = elementary sequence 
t := fseq(a);
d := [] ;
for i in [1..#t] do;
  if i eq 1 then 
     if t[i] eq 0 then 
        d[i] := 1;
     else 
        d[i] := 0 ;
     end if ;
   else 
    d[i] := 1 - t[i] + t[i-1];   // we record 1 if there is no jump in the final sequence and 0 otherwise
  end if ;
end for;
return d;
end function ;   // output = sequence of 0,1 of lenght 2g, recording the jumps in the assocoiated final sequence 

// the associated pi function 


pi := function(t);       
a := fseq(t);
d := delta(a);
p := [] ;
n := #a ;
for i in [1..n] do ;
  if d[i] eq 0 then 
    p[i] := a[i] ;
  else  
    p[i] := a[n] + i - a[i] ; 
  end if ;
end for ;
return p ; 
end function;  

// the v_B function 

vB := function(t); 
a := fseq(t);
n := #a;
S := SymmetricGroup(n) ;
r := pi(t);
d := delta(t);
v := [];
f := S ! r;
for i in [1..n] do ;
vv := [];
for j in [1..10*n] do ;
vv[j]  := (Eltseq(f^(-j))[i]);
end for;
b := [d[vv[k]]*2^(-k) : k in [1..3*n] ] ;
v[i] := &+b;
end for;
return v;
end function ;

// addition function 

addition := function(a,b) ;   // input: two (indecomposable) elementary sequences, output: their addition 
v1 := vB(a);
v2 := vB(b);
d1 := delta(a);
d2 := delta(b);
r := v1 cat v2 ;
r := Sort(r);
d := [];
for i in [1..#r] do ;
 if r[i] in v1 then ;
  m := [j : j in [1..#d1] | r[i] eq v1[j]];
  d[i] := d1[m[1]];
 else 
 m := [j : j in [1..#d2] | r[i] eq v2[j]];
d[i] := d2[m[1]];
end if;
end for;
es := [];
if d[1] eq 0 then
es[1] := 1;
else 
es[1] := 0;
end if;
for j in [2..#d] do ;
if d[j] eq 0 then  
es[j] := es[j-1] + 1;
else 
es[j] := es[j-1] ;
end if ;
end for;
n := #es;
m := n/2;
m := Integers() ! m ;
es := [es[i] : i in [1..m] ];
return es;
end function;


// multipling an indecomposable elementary sequence by itself 

mult := function(t,m); // input : t elementary sequence, m positive integer, output = t^m
d1 := delta(t);
n := #d1 ;
d := [] ;
for i in [1..n] do ;
d[i] := [ d1[i] : j in [1..m] ] ;
end for ;
dd := &cat[a : a in d];
es := [];
if dd[1] eq 0 then
es[1] := 1;
else 
es[1] := 0;
end if;
for j in [2..#dd] do ;
if dd[j] eq 0 then  
es[j] := es[j-1] + 1;
else 
es[j] := es[j-1] ;
end if ;
end for;
n := #es;
m := n/2;
m := Integers() ! m ;
es := [es[i] : i in [1..m] ];
return es;
end function;


