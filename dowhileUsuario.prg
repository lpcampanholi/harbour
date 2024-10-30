set epoch to 1940
set date to british

clear

nSomaA := 0
nSomaB := 0
nSomaC := 0

do while .t.

    nA := 0
    nB := 0
    nC := 0

    @ 01,01 say "A: "
    @ 02,01 say "B: "
    @ 03,01 say "C: "

    @ 01,04 get nA picture "99" valid nA > 0
    @ 02,04 get nB picture "99" valid nB > 0
    @ 03,04 get nC picture "99" valid nC > 0
    read

    if LastKey() == 27 // ESC
        exit
    endif

    nSomaA += nA
    nSomaB += nB
    nSomaC += nC

    @ 05,01 say "SOMA A: " + AllTrim(Str(nSomaA))
    @ 06,01 say "SOMA B: " + AllTrim(Str(nSomaB))
    @ 07,01 say "SOMA C: " + AllTrim(Str(nSomaC))

enddo

@ 10,01 say "VOCE ABANDONOU O PROGRAMA :("
inKey(0)
