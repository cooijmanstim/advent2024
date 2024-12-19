ClassifyRuns ← ¯1⊸+ ⊢ × +`∘(0⊸⌈)∘(-⟜»)
lines ← •FLines⊑•args
tokens ← ClassifyRuns∘('a'⊸≤∧≤⟜'z')⊸⊔ ⊑lines
patterns ← 2↓lines

•Show +´¨ (0⊸<⊸⋈) {𝕊pattern:
  subtokens ← ∨´∘(⍷⟜pattern)¨⊸/ tokens  # branch only with tokens in pattern
  t ← ⍉> »⟜(@⥊˜⌈´≠¨subtokens)˜¨ subtokens  # null-padded token matrix
  LeadingTokens ← {(∧˝ (t=@)∨(t=𝕩»@⥊˜≠t))/subtokens}
  Branch ← {𝕊i: i+ ≠¨ LeadingTokens i↓pattern}
  nsolutions ← 0
  { []𝕊[]: @;
    i𝕊n:
    solved ← i=≠pattern
    nsolutions +↩ +´solved/n
    i‿n (¬solved)⊸/¨↩
    ibranch‿nbranch ← {⟨(∾𝕩),(n/˜≠¨𝕩)⟩} Branch¨ i
    ibranch (⊑¨⊸𝕊⟜(+´¨))○((⊐ibranch)⊸⊔) nbranch
  }´ [0]‿[1]
  nsolutions
}¨ patterns

