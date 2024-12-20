map ← >•FLines⊑•args

_fx_ ← {F _𝕣_ G 𝕩: ⊑{p‿n: n⋈F n} •_while_ (G´) 𝕩⋈F𝕩 }
_expand ← { 𝕩 𝔽´ ⟨«,»,«˘,»˘⟩ {1+𝕎𝕩}¨ <𝕩 }
infwall ← 0‿∞⊏˜map='#'
v ← { infwall ⌈ ⌊ _expand 𝕩 } _fx_ ≢ ∞‿0⊏˜map='E'

Cheats ← {𝕊n:  # convolve with a diamond of radius n to discover cheats
c ← n‿n
d ← +´¨ |∘-⟜c˜¨ ↕ 2⥊¯1+2×n+1
vpad ← v {{∾⟨∞⥊˜n-1,𝕩,∞⥊˜n-1⟩}˘⌾𝕎 𝕩}´ ⍉‿⊢  # pad four ways
∾ { ((d≤n)∧(∞≠𝕩)∧(∞≠c⊑𝕩)) /○⥊ d-˜0⌈𝕩-c⊑𝕩 }¨ ⥊<⎉2 (≢d)↕ vpad
}

•Show +´ 99< Cheats 2
•Show +´ 99< Cheats 20

