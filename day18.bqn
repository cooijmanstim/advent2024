ParseNat ← 10⊸×⊸+˜´∘⌽ -⟜'0'
IsDigit ← '0'⊸≤∧≤⟜'9'
ClassifyRuns ← ¯1⊸+ ⊢ × +`∘(0⊸⌈)∘(-⟜»)
_fx_ ← {F _𝕣_ G 𝕩: ⊑{p‿n: n⋈F n} •_while_ (G´) 𝕩⋈F𝕩 }

blocks ← ParseNat¨¨ ClassifyRuns∘IsDigit⊸⊔¨ •FLines⊑•args
size ← {"ex":7;"in":71}¯2↑⊑•args
n0 ← {"ex":12;"in":1024}¯2↑⊑•args

FindPath ← {𝕊map:
  v ← {𝕊v:  # flow min costs backward
    (map⊏0‿∞) ⌈ v ⌊ 1+ ⌊´ {𝕏v}¨ ⟨(size⥊∞)⊸«,(size⥊∞)⊸»,∞⊸«˘,∞⊸»˘⟩
  } _fx_ (≢) 0⌾(¯1‿¯1⊸⊑) ∞¨map
  p ← {𝕊p:  # flow best-path membership forward
    p ∨´ ⟨»,«,»˘,«˘⟩ {𝕎 p ∧ v=1+𝕏v}¨ ⟨(size⥊∞)⊸«,(size⥊∞)⊸»,∞⊸«˘,∞⊸»˘⟩
  } _fx_ (≢) 1⌾(0‿0⊸⊑) 0¨map
  v‿p
}
_binsearch ← {F _𝕣 a‿b:
  ⊑ {𝕊a‿b:
    n ← ⌊a+2÷˜b-a
    ⟨a‿n,n‿b⟩ ⊑˜ F n
  } _fx_ (≢) a‿b
}

map ← size‿size⥊0
{
  v‿p ← FindPath 1¨⌾((n0↑blocks)⊸⊑) map
  •Show 0‿0⊑v
}
{
  i ← { ∞>0‿0⊑⊑FindPath 1¨⌾((𝕩↑blocks)⊸⊑) map } _binsearch ⟨0,≠blocks⟩
  •Show blocks⊑˜i
}

