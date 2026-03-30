// the matrices used to prove the results of section 5

// Lemma 42

Zp<p>:=FunctionField(Rationals());
B:=ZeroMatrix(Zp,10,10);
B[2,1]:=1;
B[3,2]:=1;
B[4,3]:=1;
B[5,4]:=p;
B[1,5]:=p;
B[7,6]:=p;
B[8,7]:=p;
B[9,8]:=p;
B[10,9]:=1;
B[6,10]:=1;
B[10,4]:=p;
B[2,6]:=-p;
C:=p*B^(-1);
print C, "\n";
print B^20, "\n";



H:=ZeroMatrix(Zp,10,10);
H[1,6]:=1;
H[6,1]:=-1;
H[2,7]:=1;
H[7,2]:=-1;
H[3,8]:=1;
H[8,3]:=-1;
H[4,9]:=1;
H[9,4]:=-1;
H[5,10]:=1;
H[10,5]:=-1;
if Transpose(B)*H eq H*C then
print "Yay! Polarised!";
else
print "No! Not polarised!";
end if


// Lemma 43

Zp<p>:=FunctionField(Rationals());
B:=ZeroMatrix(Zp,10,10);
B[2,1]:=1;
B[3,2]:=1;
B[4,3]:=1;
B[5,4]:=p;
B[6,5]:=1;
B[7,6]:=p;
B[8,7]:=p;
B[9,8]:=p;
B[10,9]:=1;
B[1,10]:=-p;
B[1,5]:=p;
C:=p*B^(-1);
print C, "\n";

print B^5;
print B^20;


H:=ZeroMatrix(Zp,10,10);
H[1,6]:=1;
H[6,1]:=-1;
H[2,7]:=1;
H[7,2]:=-1;
H[3,8]:=1;
H[8,3]:=-1;
H[4,9]:=1;
H[9,4]:=-1;
H[5,10]:=1;
H[10,5]:=-1;
if Transpose(B)*H eq H*C then
print "Yay! Polarised!";
else
print "No! Not polarised!";
end if



// Lemma 44
Qp<p>:=FunctionField(Rationals());
B:=ZeroMatrix(Qp,10,10);
B[2,1]:=1;
B[3,2]:=1;
B[4,3]:=p;
B[1,4]:=-p;
B[6,5]:=1;
B[7,6]:=1;
B[8,7]:=1;
B[9,8]:=p;
B[10,9]:=p;
B[5,10]:=-p;
B[1,7]:=p;
B[5,2]:=p;

C:=p*B^(-1);
print C, "\n";

print B^20, B^22;


H:=ZeroMatrix(Zp,10,10);
H[1,3]:=1;
H[3,1]:=-1;
H[2,4]:=1;
H[4,2]:=-1;
H[5,8]:=1;
H[8,5]:=-1;
H[6,9]:=1;
H[9,6]:=-1;
H[7,10]:=1;
H[10,7]:=-1;
if Transpose(B)*H eq H*C then
print "Yay! Polarised!";
else
print "No! Not polarised!";
print Transpose(B)*H - H*C;
end if;


// Lemma 45
Zp<p>:=PolynomialRing(Rationals());
Qp<p>:=FunctionField(Rationals());
// K:=AlgebraicClosure(Qp);
B:=ZeroMatrix(Qp,10,10);
B[2,1]:=1;
B[1,2]:=-p;
B[4,3]:=1;
B[5,4]:=1;
B[6,5]:=1;
B[7,6]:=1;
B[8,7]:=p;
B[9,8]:=p;
B[10,9]:=p;
B[3,10]:=-p;

B[3,1]:=p;
B[1,6]:=p;

C:=p*B^(-1);
print C;

print B^20, B^22;


H:=ZeroMatrix(Zp,10,10);
H[1,2]:=1;
H[2,1]:=-1;
H[3,7]:=1;
H[7,3]:=-1;
H[4,8]:=1;
H[8,4]:=-1;
H[5,9]:=1;
H[9,5]:=-1;
H[6,10]:=1;
H[10,6]:=-1;
if Transpose(B)*H eq H*C then
print "Yay! Polarised!";
else
print "No! Not polarised!";
print Transpose(B)*H , H*C;
end if;

