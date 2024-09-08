// we compute all elementary sequences in dim 5 

S := [ [0] cat [a,b,c,d,e] : a,b,c,d,e in [0..5] ];
S := [ t : t in S | t[1] le t[2] ];
S := [ t : t in S | t[2] le t[3] ];
S := [ t : t in S | t[3] le t[4] ];
S := [ t : t in S | t[4] le t[5] ];
S := [ t : t in S | t[5] le t[6]  ];    
S := [ t : t in S | t[2] - t[1] le 1];             
S := [ t : t in S | t[3] - t[2] le 1];
S := [ t : t in S | t[4] - t[3] le 1];
S := [ t : t in S | t[5] - t[4] le 1];
S := [ t : t in S | t[6] - t[5] le 1];


// the elementary sequences defining EO stata of p-rank 0 

SZero := [ a : a in S | a[2] eq 0 ];

