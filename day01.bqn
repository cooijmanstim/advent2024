ParseNat ← 10⊸×⊸+˜´ ∘⌽ -⟜'0'
IsDigit ← ('0'⊸≤∧≤⟜'9')
IdentifyRegions ← {1-˜𝕩×+`0⌈𝕩-»𝕩}
_CollectRuns ← {𝕩 ⊔˜ IdentifyRegions 𝔽 𝕩}
Numbers ← {𝕊s: ParseNat¨ IsDigit _CollectRuns s}

mat ← ⍉ > Numbers¨ •FLines ⊑ •args
•Show +´ |¨ -´ ∧¨ <⎉1 mat

