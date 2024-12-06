mat ← > {𝕊'.':0;𝕊'#':1;𝕊'^':2}¨¨•FLines⊑•args

# rotate so the guard faces east for convenience
mat ⍉∘⌽↩  # cw
pos ← (⥊↕≢mat)⊑˜⊑2⊐˜⥊mat  # extract guard position
map ← mat=1  # remove guard
visits ← 0¨ map
visits 1⌾(pos⊸⊑)↩

System ⇐ {𝕊𝕩:
  map‿visits‿pos‿history ⇐ 𝕩
  done ⇐ 0

  InCycle ⇐ {𝕊𝕩:
    # every fourth history elt faces in the same direction,
    # and is represented in the same coordinate system.
    # were we at this position a multiple of 4 steps ago?
    col←⊑<˘⍉⌊‿4⥊history
    {0=≠col? 0; ⊑((<⊑)∊1⊸↓)col}
  }
  AtEdge ⇐ {𝕊𝕩: ¬∧´ (0<⊢∧⊢<(¯1+≢map)˙) pos }

  SpacesAhead ⇐ {𝕊𝕩: # scan ahead to obstacle (guard always faces east)
    lookahead ← {𝕩↓𝕨⊏map}´ pos
    k ← ⊑ (≠⌊⊐⟜1) lookahead  # number of steps that can be walked
    pos⊸+¨ 0⊸⋈¨↕k  # positions from self up to obstacle
  }
  Step ⇐ {𝕊𝕩:
    done ↩ (InCycle ∨ AtEdge) @
    done? @;

    sa ← SpacesAhead@
    visits 1¨⌾(sa⊸⊑)↩ ⋄ pos ↩ ¯1⊑sa ⋄ history ∾˜↩ (<pos) # prepend
    # rotate map and pos ccw so that guard rotates cw relative to it
    map‿visits ⌽∘⍉¨↩ ⋄ pos {i‿j:⟨(≠map)-(j+1),i⟩}↩
  }
  StepToEnd ⇐ {𝕊𝕩:
    Step •_while_ {𝕊𝕩:¬done} @
  }

  ConsiderObstacles ⇐ {𝕊𝕩:
    sa ← SpacesAhead@
    # consider an obstacle at each yet unvisited(aka unconsidered) space ahead,
    # simulate to see if it leads to a cycle
    LeadsToCycle ← {𝕩:
      sys ← System ⟨1⌾(𝕩⊸⊑)map,visits,pos,history⟩
      sys.StepToEnd@ ⋄ sys.InCycle@
    }
    +´ LeadsToCycle¨ (¬visits) (⊑˜/⊢) sa
  }
  CountPotentialCycles ⇐ {𝕊𝕩:
    {𝕊𝕩: 𝕩+↩ConsiderObstacles@ ⋄ Step@ ⋄ 𝕩} •_while_ {𝕊𝕩:¬done} 0
  }
}

sys ← System map‿visits‿pos‿⟨⟩
sys.StepToEnd@
•Show +´⥊ sys.visits

sys2 ← System map‿visits‿pos‿⟨⟩
•Show sys2.CountPotentialCycles@

