sizes ← -⟜'0' ⊑•FLines ⊑•args

xs ← ↕∘≠⊸(/˜) ⊑<˘ ⍉↑‿2⥊sizes
·‿·‿yss ← {𝕊i‿xs‿yss:
  n←i⊑sizes
  { 0=2|i? ⟨i+1,   n↓xs,yss∾<    n↑xs⟩ # file
    ;      ⟨i+1,(-n)↓xs,yss∾<⌽(-n)↑xs⟩ # space
  }
} •_while_ {𝕊i‿xs‿yss: 0≠≠xs} 0‿xs‿⟨⟩
•Show +´ ↕∘≠⊸× ∾ yss

names ← (≠sizes)⥊ ⍉ ¯1¨⊸(≍˜)  ↕⌈2÷˜≠sizes
poses ← +` »sizes
files‿spaces ← >¨ (¯1=names)⊸⊔∘(<˘) ⍉ [names,sizes,poses]

•Show +´ {𝕊name‿n‿x:
  contribution ← name×+´x+↕n  # contribution if no move
  { 𝕊[]: contribution;  # no room
    𝕊𝕩: i←⊑𝕩
    ·‿spn‿spx←i⊏spaces
    { spx≥x? contribution;  # no room before
      spaces (spn=n)◶⟨
        [¯1,spn-n,spx+n]⌾(i⊸⊏),  # adjust space
        i⊸↑ ∾ (i+1)⊸↓,           # remove 0 width space
      ⟩↩
      name×+´spx+↕n  # contribution after move
    }
  } /n≤1⊏⍉spaces
}¨ <˘⌽files

