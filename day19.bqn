ClassifyRuns ← ¯1⊸+ ⊢ × +`∘(0⊸⌈)∘(-⟜»)
lines ← •FLines⊑•args
tokens ← ClassifyRuns∘('a'⊸≤∧≤⟜'z')⊸⊔ ⊑lines
patterns ← 2↓lines

•Show +´¨ (0⊸<⊸⋈) {𝕊pattern:
  subtokens ← ∨´∘(⍷⟜pattern)¨⊸/ tokens  # branch only with tokens in pattern
  t ← ⍉> { 𝕩»@⥊˜⌈´≠¨subtokens }¨ subtokens  # null-padded token matrix
  LeadingTokens ← {(∧˝ (t=@)∨(t=𝕩»@⥊˜≠t))/subtokens}
  { 𝕊[]: 0;
    ∧´(≠pattern)=0⊏˘𝕩? +´ 1⊏˘𝕩;
    solved ← ((≠pattern)⊸=⊏˘)⊸/ 𝕩
    branches ← ∾ {𝕊i‿n: {⍉𝕩≍((≠𝕩)⥊n)} i+ ≠¨ LeadingTokens i↓pattern}¨ <˘ 𝕩
    𝕊 > ((+´ 1⊸⊏˘) ⋈˜ ⊑)¨ ⊐∘(⊏˘)⊸⊔ solved ∾ branches
  } [0‿1]
}¨ patterns

