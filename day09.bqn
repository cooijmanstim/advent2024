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

•Show +´ {𝕊name‿size‿pos:
  contribution ← name×+´pos+↕size  # contribution if no move
  {𝕊[]: contribution;
   𝕊𝕩: i←⊑𝕩
    ·‿spacesize‿spacepos←i⊏spaces
    { spacepos≥pos? contribution;
      spaces ([¯1,spacesize-size,spacepos+size]⌾(i⊸⊏))↩
      name×+´spacepos+↕size  # contribution after move
    }
  } /size≤1⊏⍉spaces
}¨ <˘⌽files

