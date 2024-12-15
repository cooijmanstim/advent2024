lines ← •FLines⊑•args
map‿moves ← >¨ lines (↑ ⋈ 1⊸+⊸↓)˜ ⊑/ ⟨⟩⊸≡¨ lines

Simulate ← {𝕊map‿markblob:
  map {move𝕊map:
    push ← {'>':{»˘};'<':{«˘};'v':{»};'^':{«}} move
    pull ← {'>':{«˘};'<':{»˘};'v':{«};'^':{»}} move
    src ← MarkBlob map‿push‿pull
    dst ← Push src
    infront‿behind ← dst (∧⟜¬ ⋈ ¬⊸∧) src
    { ∨´⥊('#'=map)∧infront ? map;
      !∧´⥊('.'=map)∨¬infront
      '.'¨⌾((⥊behind)⊸/)⌾⥊ (src/○⥊map)⌾((⥊dst)⊸/)⌾⥊ map
    }
  }´⌽ ⥊moves
}

# flood fills to mark all the objects that will move (self and boxes)
_fx_ ← {F _𝕣_ G 𝕩: ⊑{p‿n: n⋈F n} •_while_ (G´) 𝕩⋈F𝕩 }
MarkBlob1 ← {𝕊map‿push‿pull:
  { 𝕩 ∨ Push 𝕩∧"O"∊˜Pull map
  } _fx_ ≢ map='@'
}
MarkBlob2 ← {𝕊map‿push‿pull:
  { 𝕩 ∨ (Push 𝕩∧"[]"∊˜Pull map) ∨ (»˘)⊸∨⟜(«˘)´ 𝕩⊸∧¨ map⊸=¨"[]"
  } _fx_ ≢ map='@'
}

finalmap ← Simulate map‿MarkBlob1 
•Show +´ +´∘(100‿1⊸×)¨ 'O'⊸=⊸/○⥊⟜(↕∘≢) finalmap

map2 ← (1‿2×≢map)⥊ >{'.':"..";'O':"[]";'#':"##";'@':"@."}¨ map
finalmap2 ← Simulate map2‿MarkBlob2
•Show +´ +´∘(100‿1⊸×)¨ '['⊸=⊸/○⥊⟜(↕∘≢) finalmap2

