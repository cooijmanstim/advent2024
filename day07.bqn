ParseNat ← 10⊸×⊸+˜´ ∘⌽ -⟜'0'
IsDigit ← '0'⊸≤∧≤⟜'9'
IdentifyRegions ← {¯1+𝕩×+`0⌈𝕩-»𝕩}
_CollectRuns ← {IdentifyRegions∘𝔽⊸⊔}
CollectNumbers ← {𝕊s: ParseNat¨ IsDigit _CollectRuns s}

equations ← CollectNumbers¨ •FLines⊑•args

Cat ← {𝕩+𝕨×10⋆1+⌊10⋆⁼𝕩}
Part ← {𝕊ops:
  +´ {
    y←⊑𝕩 ⋄ xs←1↓𝕩
    Search ← {z𝕊xs:{
      y<z ? 0;  # abandon branch if already exceeding y
      0=≠xs ? z=y;
      ∨´ {(z𝕏⊑xs) Search 1↓xs}¨ ops  # could short-circuit this
    }}
    y× (⊑ Search 1⊸↓) xs
  }¨ equations
}

•Show Part ×‿+
•Show Part Cat‿×‿+

