ParseNat ← 10⊸×⊸+˜´ ∘⌽ -⟜'0'
IsDigit ← '0'⊸≤∧≤⟜'9'
IdentifyRegions ← {¯1+𝕩×+`0⌈𝕩-»𝕩}
_CollectRuns ← {IdentifyRegions∘𝔽⊸⊔}
CollectNumbers ← {𝕊s: ParseNat¨ IsDigit _CollectRuns s}

lines ← CollectNumbers¨ •FLines⊑•args
rules‿batches ← (((<⟨⟩)⊐˜⊢) (↑⋈1⊸+⊸↓) ⊢) lines
n ← 1+ ⌈´ ∾ lines
mat ← (n‿n⥊0) {a‿b𝕊mat: 1⌾(a‿b⊸⊑) mat}´ rules

IsOrdered ← {𝕊xs:
  #!xs≡⍷xs  # no duplicates
  rs← (⊑⟜mat)⊸/ ⥊⋈⌜˜xs  # relevant rules
  ∧´ ((∧´⥊) <○ (xs⊸⊐)⟜<)´¨ rs  # for each rule A|B, A occurs before B
}
correct ← IsOrdered¨ batches

MidElt ← (⌊∘÷⟜2∘≠)⊑⊢
•Show +´ MidElt¨ correct/batches

Order ← {𝕊xs:
  #!xs≡⍷xs  # no duplicates
  m←xs⊏xs⊸⊏˘mat  # relevant rows/columns of the adjacency matrix
  m ↩ ¯∞⋆¬m  # replace zeros with neg infs; note ¯∞⋆0=1, ¯∞⋆1=¯∞
  m 0¨⌾(0‿0⊸⍉)↩  # zeros on the diagonal
  MP ← ((⌈´∘+)⌜○(<˘))⟜⍉  # max-plus matrix-matrix product
  cm ← MP˜⍟(⌈2⋆⁼≠xs) m  # "square" log_2 n times
  xs ⊏˜ ⍋ ⌈´˘⍉cm  # sort according to longest incoming edge
}
•Show +´ MidElt¨ Order¨ correct¬⊸/batches

