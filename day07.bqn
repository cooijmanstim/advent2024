ParseNat ← 10⊸×⊸+˜´ ∘⌽ -⟜'0'
IsDigit ← '0'⊸≤∧≤⟜'9'
IdentifyRegions ← {¯1+𝕩×+`0⌈𝕩-»𝕩}
_CollectRuns ← {IdentifyRegions∘𝔽⊸⊔}
CollectNumbers ← {𝕊s: ParseNat¨ IsDigit _CollectRuns s}

equations ← CollectNumbers¨ •FLines⊑•args

Cat ← {𝕩+𝕨×10⋆1+⌊10⋆⁼𝕩}
•Show¨ {𝕊ops:
  +´ {
    y←⊑𝕩 ⋄ xs←1↓𝕩
    Foo ← {z𝕊xs:{
      y<z ? 0;  # abandon branch if already exceeding y
      0=≠xs ? z=y;
      ∨´ {(z𝕏⊑xs) Foo 1↓xs}¨ ops  # could short-circuit this
    }}
    y× (⊑Foo 1⊸↓) xs
  }¨ equations
}¨ ⟨×‿+,Cat‿×‿+⟩

