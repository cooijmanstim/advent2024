Gcd ← {
  !𝕨≠0 ⋄ !𝕩≠0
  𝕨{𝕨𝕊0: 𝕨;
    𝕨𝕊𝕩: 𝕨(⌊𝕊⌊|⌈)𝕩}𝕩
}

map ← >•FLines⊑•args
xss ← (((1⊸↓)∘(¯1⊸+)∘⊐∘("."⊸∾)∘⥊)⊔(⥊∘↕∘≢)) map  # index lists by channel
InBounds ← (∧´∘(0⊸≤∧<⟜(≢map))¨)⊸/
Antinodes ← {𝕊generate:
  ⍷ InBounds ∾ (∾∘(Generate´¨)∘(≢´¨/⊢)∘⥊∘(⋈⌜˜))¨ xss
}
•Show ≠ Antinodes {{p𝕊q: p⊸+∘((q-p)⊸×)¨ ¯1‿2}}
•Show ≠ Antinodes {{p𝕊q:
  dx ← (∧´0⊸=)◶⟨⊢,÷⟜(Gcd´∘|)⟩ q-p
  back‿forth ← ⌈´¨⌈| dx÷˜¨ (p-0)‿(p-˜≢map)
  p⊸+∘(dx⊸×)¨ back-˜↕back+forth
}}

