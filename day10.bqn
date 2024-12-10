map ← '0'-˜ > •FLines⊑•args

_part_ ← {Combine _𝕣_ Where x0:
  {𝕊x:
    x0 Combine´ {𝕏⁼ (» 𝕏 x) Where 1= »⊸- 𝕏 map}¨ ⥊ ⌽‿⊢{𝕎∘𝕏}⌜⍉‿⊢
  }⍟9 x0
}

ListWhere ← (⊣⊑⟨⟩⊸⋈)˜¨  # ⟨⟩ where 𝕩=0, 𝕨 where 𝕩=1
y1 ← ∾¨ _part_ ListWhere (⋈¨∘↕∘≢ ListWhere 9⊸=) map
•Show +´⥊ (≠∘⍷¨y1)×map=0

y2 ← + _part_ × map=9
•Show +´⥊ y2×map=0
