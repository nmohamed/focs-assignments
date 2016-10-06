Nora Mohamed

[x] the internet helped me

---
## 1a
_a_ | _b_ | _a_ XOR (b XOR a)
----|-----|---
 F  |  F  | F
 F  |  T  | T
 T  |  F  | F
 T  |  T  | T

## 1b

_a_ | _b_ | _a_ XNOR _b_
----|-----|---
 F  |  F  | T
 F  |  T  | F
 T  |  F  | F
 T  |  T  | T

---
## 2
![](pda.png)

## 3
S0 -> E+E | TxT | (E)
E -> E+E | TxT | (E)
T -> TxT | (E) | a

## 4
No. (a+**a)xa** --> (a+**a)xaa)xa** --> not possible

## 5a
We have a collection A=({a^i b^j c^j}, {a^i b^i c^j}). {a^i b^j c^j} ∩ {a^i b^i c^j} = {a^n b^n c^n} since |a|=|b| and |b|=|c|. Theorem 1 is not part of A, so the collection of subsets is not closed under intersection.

## 5b

a^n b^n c^n

aaa**bbb**ccc

aaa**bbbbbbbbbb**ccc -> Not regular

## 6a
S

NP VP

DETN VP

DETN VP PP

DETN VNP PP

DETN V DETN PP

DETN V DETN PNP

DETN V DETN P DETN


**OR**


S

NP VP

DETN VP

DETN V NP

DETN V NP PP

DETN V DETN PP

DETN V DETN PNP

DETN V DETN P DETN

## 6b
Either the girl touches the boy via a flower instead of limb, or she touches a boy holding a flower.

## 6c
DETN P DET N V DET N
`A flower from the girl sees a girl.` Does the flower have eyes and can actually look at the other girl, or is it passed on to the other girl and everntually "see" or meet her?

## 6d

```
S -> NP VP
NP -> NP PP
NP -> DET N
NP -> DET A N
VP -> V NP
VP -> VP PP
DET -> a | the
N -> boy | girl | flowers | binoculars
A -> tall | purple
V -> touches | sees
PP -> P NP
P -> in | from | with
```