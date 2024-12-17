ParseNat ← 10⊸×⊸+˜´∘⌽ -⟜'0'
IsDigit ← '0'⊸≤∧≤⟜'9'
IdentifyRegions ← ¯1⊸+ ⊢ × +`∘(0⊸⌈)∘(-⟜»)
_CollectRuns ← {IdentifyRegions∘𝔽⊸⊔}
CollectNumbers ← {𝕊s: ParseNat¨ IsDigit _CollectRuns s}

l ← CollectNumbers¨ •FLines⊑•args
reg ← ⊑¨ 3↑l
prog ← ¯1⊑l

•Show reg
•Show prog
!∧´prog<8

off←2⋆52 ⋄ Xor ← {off-˜ ⊑{(8•bit._xor˝ 6↑˘𝕩)∾6↓⊏𝕩}⌾(64‿8•bit._cast⊢)≍˘𝕨‿𝕩+off}  # thank you dzaima
DownShift ← ⌊∘(⊢÷(2⋆⊣))

Step ← {𝕊⟨a‿b‿c,xs,i⟩:
  Combo← {4:a;5:b;6:c;7:!0;𝕩}
  my ← ⟨⟩
  nexti ← i+2
  {
    0𝕊x: a ↩ (Combo x) DownShift a;
    6𝕊x: b ↩ (Combo x) DownShift a;
    7𝕊x: c ↩ (Combo x) DownShift a;
    1𝕊x: b ↩ x Xor b;
    2𝕊x: b ↩ 8|Combo x;
    3𝕊x: {a=0?@;nexti↩x};
    4𝕊x: b ↩ b Xor c;
    5𝕊x: my ↩ ⋈8|Combo x
  }` xs⊑˜ ⟨i⟩‿⟨i+1⟩
  nexti
  ⟨a‿b‿c,xs,nexti⟩‿my
}
IsDone ← 2⊸⊑≥≠∘(1⊸⊑)

Run ← {reg𝕊prog:
  ys ← ⟨⟩
  state ← {
    state‿my ← Step 𝕩
    ys ∾↩ my
    state
  } •_while_ (¬∘IsDone) reg‿prog‿0
  state‿ys
}

! 1≡1⊑⊑⊑ 0‿0‿9 Run 2‿6
! 0‿1‿2≡1⊑ 10‿0‿0 Run 5‿0‿5‿1‿5‿4
! 4‿2‿5‿6‿7‿7‿7‿7‿3‿1‿0≡1⊑ 2024‿0‿0 Run 0‿1‿5‿4‿3‿0
! 0≡0⊑⊑⊑ 2024‿0‿0 Run 0‿1‿5‿4‿3‿0
! 26≡1⊑⊑⊑ 0‿29‿0 Run 1‿7
! 44354≡1⊑⊑⊑ 0‿2024‿43690 Run 4‿0

•Show 1⊑ reg Run prog

NatFromDigits ← {0⊸(𝕨⊸×⊸+˜´) 𝕩}

# based on my input:
# B and C registers are only for temps, A gets shifted down by one octal digit at a time. build up A one octal digit at a time, from most significant (last output) to least significant (first output)
TheProgram ← { 1⊑ 𝕩‿0‿0 Run prog }
Search ← {
  ds𝕊⟨⟩: ds;
  ds𝕊xs:
  candidates ← (8×⊑≢ds)‿∘ ⥊ {𝕊i:{i∾𝕩}˘ ds}˘ ↕8
  matches ← {𝕩≡(-≠𝕩)↑prog}¨ TheProgram¨ 8⊸NatFromDigits¨ <˘ candidates
  (1↓xs) Search˜ matches/candidates
}
ds ← (≍˘↕8) Search 1↓⌽prog
ns ← 8⊸NatFromDigits˘ ds
•Show ⌊´ns

