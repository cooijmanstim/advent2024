MainDiagonal←{(⥊𝕩)⊏˜(1+¯1⊑≢𝕩)×↕⌊´≢𝕩}
Diagonals←{𝕊x:
  m‿n←≢x
  ∾´ ⟨
    (⋈MainDiagonal x),
    ({𝕊i: MainDiagonal i⊸↓ x}¨ 1↓↕m),
    ({𝕊j: MainDiagonal j⊸↓˘x}¨ 1↓↕n),
  ⟩
}

x ← > •FLines ⊑•args
haystacks ← ∾´ ⟨ <˘x, <˘⍉x, Diagonals x, Diagonals ⌽x ⟩
needles ← "XMAS"‿"SAMX"
•Show +´⥊ (+´∘⥊)¨ needles ⍷⌜ haystacks

•Show +´⥊ {∧´ ∨´<˘ "MAS"‿"SAM" ≡⌜<˘ (2‿4‿6≍0‿4‿8) ⊏ ⥊𝕩}⎉2 3‿3↕x

