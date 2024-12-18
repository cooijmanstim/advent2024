ParseNat ← 10⊸×⊸+˜´∘⌽ -⟜'0'
IsDigit ← '0'⊸≤∧≤⟜'9'
ClassifyRuns ← ¯1⊸+ ⊢ × +`∘(0⊸⌈)∘(-⟜»)
_fx_ ← {F _𝕣_ G 𝕩: ⊑{p‿n: n⋈F n} •_while_ (G´) 𝕩⋈F𝕩 }

blocks ← ParseNat¨¨ ClassifyRuns∘IsDigit⊸⊔¨ •FLines⊑•args
size ← {"ex":7;"in":71}¯2↑⊑•args
n0 ← {"ex":12;"in":1024}¯2↑⊑•args

Expand ← { 𝕨 ∧ ∨´ ⟨⊢,«,»,«˘,»˘⟩ {𝕎𝕩}¨ <𝕩 }
PathLength ← {𝕊map:  # assumes existence
  ⊑ { 𝕊t‿p: (t+1) ⋈ (¬map) Expand p
  } •_while_ {𝕊t‿p: ¬¯1‿¯1⊑p} 0⋈ 1⌾(0‿0⊸⊑) 0¨map
}
PathExistence ← {𝕊map:
  ¯1‿¯1 ⊑ (¬map)⊸Expand _fx_ (≢) 1⌾(0‿0⊸⊑) 0¨map
}
_binsearch ← {F _𝕣 a‿b:
  ⊑ {𝕊a‿b:
    n ← ⌊a+2÷˜b-a
    ⟨a‿n,n‿b⟩ ⊑˜ F n
  } _fx_ (≢) a‿b
}

map ← size‿size⥊0
•Show PathLength 1¨⌾((n0↑blocks)⊸⊑) map
n ← { PathExistence 1¨⌾((𝕩↑blocks)⊸⊑) map } _binsearch ⟨0,≠blocks⟩
•Show blocks⊑˜n

