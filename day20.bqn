map ← >•FLines⊑•args

v ← { # find the one path and measure distance to goal (∞ for walls)
  path ← ⋈ ⊑ (map='S') /○⥊ ↕≢map
  {𝕩
    candidates ← (⊑path)⊸+¨ <˘ ∘‿2⥊¯1‿0‿0‿¯1‿1‿0‿0‿1
    path ∾˜↩ < ⊑ {1<≠path?𝕩≢1⊑path;1}¨⊸/ ('#'⊸≠∘(map⊸(⊑˜)))⊸/ candidates
  } •_while_ {𝕩⋄ 'E'≠map⊑˜⊑path} path
  (↕≠path)⌾(path⊸⊑) (≢map)⥊∞
}

Cheats ← {𝕊n:  # convolve with a diamond of radius n to discover cheats
c ← n‿n
d ← +´¨ |∘-⟜c˜¨ ↕ 2⥊¯1+2×n+1
vpad ← v {{∾⟨∞⥊˜n-1,𝕩,∞⥊˜n-1⟩}˘⌾𝕎 𝕩}´ ⍉‿⊢  # pad four ways
∾ { ((d≤n)∧(∞≠𝕩)∧(∞≠c⊑𝕩)) /○⥊ d-˜0⌈𝕩-c⊑𝕩 }¨ ⥊<⎉2 (≢d)↕ vpad
}

•Show +´ 99< Cheats 2
•Show +´ 99< Cheats 20

