ParseNat ← 10⊸×⊸+˜´∘⌽ -⟜'0'
IsDigit ← '0'⊸≤∧≤⟜'9'
IdentifyRegions ← ¯1⊸+ ⊢ × +`∘(0⊸⌈)∘(-⟜»)
_CollectRuns ← {IdentifyRegions∘𝔽⊸⊔}
CollectNumbers ← {𝕊s: ParseNat¨ IsDigit _CollectRuns s}
xs←CollectNumbers⊑•FLines⊑•args

table ← ⟨⟩ •HashMap ⟨⟩
Count ← {
  0𝕊x: 1;
  depth𝕊x: {
    ¯1:  # if not present in table
      Descend ← (depth-1)⊸Count
      n ← {0: Descend 1;
           s←•Repr 𝕩
           0=2|≠s? +´ Descend¨ ParseNat¨ ⌊∘(2⊸(÷˜))∘≠⊸(↑⋈↓) s;
           Descend 2024×𝕩} x
      depth‿x table.Set n
      n;
    𝕩  # return value from table
  } ¯1 table.Get depth‿x
}

•Show +´ 25 Count¨ xs
•Show +´ 75 Count¨ xs

