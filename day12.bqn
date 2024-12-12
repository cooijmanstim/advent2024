x ← >•FLines⊑•args

dirs ← ⥊ ⊢‿⌽ {𝕎 𝕏 0‿1}⌜ -‿⊢
Segment ← {𝕊x:
  segmentation ← 0¨x
  InBounds ← ∧´ 0⊸≤∧<⟜(≢x)
  Flood ← {s𝕊i:
    0=i⊑segmentation?
    segmentation s⌾(i⊸⊑)↩
    s⊸Flood¨ {𝕊j: i =○(⊑⟜x) j}¨⊸/ InBounds¨⊸/ i⊸+¨ dirs
    ;@ # already visited
  }
  (1+↕≠⥊x) Flood¨ (⥊↕≢x)
  ⊐⌾⥊ segmentation # canonicalize numbering
}

segmentation ← Segment x

Crop ← ∨´˘⊸/ {𝔽 _𝕣 𝕩: 𝔽⌾⍉ 𝔽 𝕩}
Pad ← 1⊸⌽∘(0‿0⊸∾)˘ {𝔽 _𝕣 𝕩: 𝔽⌾⍉ 𝔽 𝕩}
regions ← Pad∘Crop∘(segmentation⊸=)¨ ↕1+⌈´⥊segmentation  # one-hot map for each region
edgemapss ← {𝕊r: {(«˘⊸-)⌾𝕏 r}¨ ⊢‿⍉}¨ regions  # h/v edgemap for each region

areas ← +´∘⥊¨ regions
edges1 ← +´¨ +´∘⥊¨¨| edgemapss  # count edges
•Show areas +´∘× edges1

edges2 ← +´¨ {≠⍷ (𝕩≠0)⊸(/○⥊) Segment 𝕩}¨¨ edgemapss  # count regions of edges
•Show areas +´∘× edges2

