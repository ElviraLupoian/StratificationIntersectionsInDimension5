// we compute all elementary sequences corresponding to EO strata  for dimensions 5 and 6 

// g = 5 


S :=  [ [0, a,b,c,d,e] : a,b,c,d,e in [0..5] ];

for i in [1..5] do ;
S := [ s : s in S | s[i] le s[i+1] ] ;
end for ;

for i  in [1..5] do ;
S := [ s : s in S | s[i+1] le s[i] +1 ] ;
end for ;

print "The complete list of elementary sequences in dimension 5 is:";

S;

print "There are:";
#S;
print "elementary sequences in total";
// g = 6 


S :=  [ [0, a,b,c,d,e,f] : a,b,c,d,e,f in [0..6] ];

for i in [1..6] do ;
S := [ s : s in S | s[i] le s[i+1] ] ;
end for ;

for i  in [1..6] do ;
S := [ s : s in S | s[i+1] le s[i] +1 ] ;
end for ;

print "The complete list of elementary sequences in dimension 6 is:";

S;

print "There are:";
#S;
print "Elementary sequences in total";

