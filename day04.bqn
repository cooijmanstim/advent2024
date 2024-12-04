Swizzle ← {↑‿(1+2×¯1⊑≢𝕩) ⥊ 𝕩∾˘' '¨𝕩}  # turn diagonals vertical

x ← > •FLines ⊑•args
haystacks ← ∾´ ⟨ <˘x, <˘⍉x, <˘⍉Swizzle x, <˘⍉Swizzle ⌽x ⟩
needles ← "XMAS"‿"SAMX"
•Show +´⥊ (+´∘⥊)¨ needles ⍷⌜ haystacks

•Show +´⥊ {∧´ ∨´<˘ "MAS"‿"SAM" ≡⌜<˘ (2‿4‿6≍0‿4‿8) ⊏ ⥊𝕩}⎉2 3‿3↕x

