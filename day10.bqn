map ← '0'-˜ > •FLines⊑•args

_part_ ← {Combine _𝕣_ Where x9:
  x9 {h𝕊x:
    Combine´ {(𝕏 x) Where h=map}¨ ⟨«,«˘,»,»˘⟩
  }´ ↕9
}

ListWhere ← {𝕨𝕊0:⟨⟩;0𝕊𝕩:⟨⟩;𝕨}¨  # where(𝕩,𝕨,⟨⟩) but with middle case to deal with accidental zeros when « gets the fill wrong :-(
y1 ← ∾¨ _part_ ListWhere (⋈¨∘↕∘≢ ListWhere 9⊸=) map
•Show +´⥊ (≠∘⍷¨y1)×map=0

y2 ← + _part_ × map=9
•Show +´⥊ y2×map=0
