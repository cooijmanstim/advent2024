map ← >•FLines⊑•args

xss ← 128⥊<⟨⟩  # index lists by channel
↕∘≢⊸({
  x𝕊'.': @;
  x𝕊c: xss ((<x)⊸∾)⌾((c-@)⊸⊑)↩
}¨) map

Gcd ← {
  !𝕨≠0 ⋄ !𝕩≠0
  𝕨{𝕨𝕊0: 𝕨;
    𝕨𝕊𝕩: 𝕨(⌊𝕊(⌊|⌈))𝕩}𝕩
}

Antinodes ← {𝕊generate:
  nodemap ← 0¨map
  {𝕊⟨⟩: @;
   𝕊xs:
    ys ← (≢´¨/⊢)⥊⋈⌜˜ xs  # pairs of distinct antennae
    ys ∾∘(Generate´¨)↩  # collect candidates
    ys ((∧´∘(0⊸≤∧<⟜(≢nodemap)))¨/⊢)↩  # filter in bounds
    nodemap 1¨⌾(ys⊸⊑)↩
  }¨ xss
  nodemap
}

•Show +´⥊ Antinodes ⊑⟨{p𝕊q: p⊸+¨ (q-p)⊸×¨ ¯1‿2}⟩
•Show +´⥊ Antinodes ⊑⟨{p𝕊q:
  dx ← (∧´0⊸=)◶⟨⊢,÷⟜(Gcd´∘|)⟩ q-p
  back‿forth ← ⌈´¨⌈| dx÷˜¨ (p-0)‿(p-˜≢map)
  p⊸+∘(dx⊸×)¨ back-˜↕back+forth
}⟩

