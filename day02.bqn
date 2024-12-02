ParseNat ← 10⊸×⊸+˜´ ∘⌽ -⟜'0'
IsDigit ← ('0'⊸≤∧≤⟜'9')
IdentifyRegions ← {1-˜𝕩×+`0⌈𝕩-»𝕩}
_CollectRuns ← {𝕩 ⊔˜ IdentifyRegions 𝔽 𝕩}
Numbers ← {𝕊s: ParseNat¨ IsDigit _CollectRuns s}
Diff ← 1⊸↓-¯1⊸↓ 

lines ← •FLines ⊑ •args
IsSafe ← {
  {(∧´0=Diff×𝕩)∧(∧´(1⊸≤∧≤⟜3)|𝕩)} Diff 𝕩
}
•Show +´ (IsSafe∘Numbers)¨ lines

IsSafe2 ← {𝕊x:
  candidates ← (⋈x)∾ {𝕊i: (i↑x)∾((i+1)↓x)}¨ ↕≠x
  ∨´ IsSafe¨ candidates
}
•Show +´ (IsSafe2∘Numbers)¨ lines

