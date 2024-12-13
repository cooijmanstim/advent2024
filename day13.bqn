ParseNat ← 10⊸×⊸+˜´∘⌽ -⟜'0'
IsDigit ← '0'⊸≤∧≤⟜'9'
IdentifyRegions ← ¯1⊸+ ⊢ × +`∘(0⊸⌈)∘(-⟜»)
_CollectRuns ← {IdentifyRegions∘𝔽⊸⊔}
CollectNumbers ← {𝕊s: ParseNat¨ IsDigit _CollectRuns s}
prizes← <˘ ¯1↓˘ ↑‿4⥊ CollectNumbers¨•FLines⊑•args

LDiv22 ← {[a‿b,c‿d]𝕊v: ((a×d)-(b×c))÷˜ [d‿(-b),(-c)‿a] +´∘×⌜○(<˘) ≍v}
{𝕊offset:
  •Show +´ {
    m ← ⍉>2↑𝕩 ⋄ v ← >offset+¯1⊑𝕩
    u ← ⥊ m LDiv22 v
    ≡⟜⌊ u ? 3‿1 +´∘× u; 0
  }¨ prizes
}¨ 0‿10000000000000

