ParseNat ← { !∧´ IsDigit 𝕩 ⋄ 10⊸×⊸+˜´∘⌽ -⟜'0' 𝕩 }
ParseInt ← {'-'=⊑𝕩? -ParseNat 1↓𝕩; ParseNat 𝕩}
IsDigit ← '0'⊸≤∧≤⟜'9'
IsNumeric ← '-'⊸=∨'0'⊸≤∧≤⟜'9'
IdentifyRegions ← ¯1⊸+ ⊢ × +`∘(0⊸⌈)∘(-⟜»)
_CollectRuns ← {IdentifyRegions∘𝔽⊸⊔}
CollectNumbers ← {𝕊s: ParseInt¨ IsNumeric _CollectRuns s}

p‿v ← ((2⊸↑˘)⋈(2⊸↓˘)) > CollectNumbers¨•FLines⊑•args
extent ← 101‿103

Simulate ← (extent⊸|˘)∘(p⊸+)∘(v⊸×)
Matify ← {1¨⌾((<˘𝕩)⊸⊑) extent⥊0}

•Show ×´+´(↕4)⊸=¨⊐ (¬∘∨´∘(2⊸↑))¨⊸/<˘ {𝕩 (=∾<∾>) 0.5-˜2÷˜extent}˘ Simulate 100

# all robots have period 101×103, so global period is 101×103
# find the maximally horizontally symmetric state
•Show t ← ⊑⍒ { (+´÷≠) (/○⥊)⟜(=⟜⌽) Matify 𝕩 }¨ Simulate¨ ↕×´extent

•Show " #"⊏˜ ⍉ Matify Simulate t
