_fx_ ← {F _𝕣_ G 𝕩: ⊑{p‿n: n⋈F n} •_while_ (G´) 𝕩⋈F𝕩 }

map ← >•FLines⊑•args
shifts ← > ⟨⟨»˘,«˘⟩,⟨»,«⟩,⟨«˘,»˘⟩,⟨«,»⟩⟩ # east south west north

infwall ← 0‿∞⊏˜map='#'
v ← {𝕊v:  # flow min costs backward
  forward_v ← shifts {push‿pull𝕊vi:
    1 + Pull vi
  }˘ v
  rotate_v ← 1000 + (¯1⊸⌽⌊1⊸⌽) v
  goal_v ← ∞‿0⊏˜map='E'
  infwall⊸⌈˘ goal_v⊸⌊˘ forward_v⌊rotate_v
} _fx_ ≢ ∞⥊˜4∾≢map  # value map for each heading
•Show ⊑ (map='S') /○⥊ 0⊏v

p ← {𝕊p:  # flow best-path membership forward
  forward_p ← shifts {push‿pull𝕊pi‿vi:
    Push pi ∧ vi=1+Pull vi
  }˘ p⋈˘v
  rotate_p ← ∨´ {(-𝕩)⌽p ∧ v=1000+𝕩⌽v}¨ ¯1‿1
  p ∨ forward_p ∨ rotate_p
} _fx_ ≢ (map='S')⌾⊏ 0¨v
•Show +´⥊∨´<˘p

