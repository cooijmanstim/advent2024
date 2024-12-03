ParseNat ← 10⊸×⊸+˜´ ∘⌽ -⟜'0'
IsDigit ← '0'⊸≤∧≤⟜'9'
FirstOccurrence ← {w𝕊x:
  o←w⍷x , i←⊑1⊐˜o
  {i=≠o ? ¯1; i}
}
AppearsAt ← {x𝕊xs‿i: {i≥≠xs ? 0 ; x=i⊑xs}}
ConsumeDigits ← {𝕊s:
  i ← +⟜1 •_while_ {𝕩≥≠s ? 0 ; IsDigit 𝕩⊑s} 0
  i‿(i↑s)
}

ConsumeMul ← {𝕊s:
  done_signal←¯1‿@
  i← "mul(" FirstOccurrence s
  {i=¯1 ? done_signal;  # reached end, no further mul()s
   i+↩4
   skip_signal←i‿@
   k‿a ← ConsumeDigits i↓s
   {k=0 ? skip_signal;  # not followed by any digits
    ¬ ',' AppearsAt s‿(i+k) ? skip_signal;  # not followed by comma
    l‿b ← ConsumeDigits (i+k+1)↓s
    {l=0 ? skip_signal;  # not followed by any digits
     ¬ ')' AppearsAt s‿(i+k+1+l) ? skip_signal;  # not followed by closing parenthesis
     ⟨i+k+1+l, ParseNat¨ a‿b⟩
  }}}
}

ss ← •FChars ⊑•args
CollectMuls ← {muls𝕊s:
  {0=≠s? muls;
   pos‿ab ← ConsumeMul s
   #! s≢pos↓s
   {pos=¯1 ? muls;
    {ab≡@? muls; muls∾(<ab)} CollectMuls pos↓s
  }}
}
•Show +´ ×´¨ ⟨⟩ CollectMuls ss

CollectDoRegions ← {regions𝕊s:
  {0=≠s? regions;
   i← "don't()" FirstOccurrence s
   {i=¯1 ? regions∾<s;  # reached end; take all of s
    # found don't(); look to recurse after the next do()
    regions∾↩<i↑s
    k←"do()" FirstOccurrence i↓s
    {k=¯1 ? regions;  # reached end
     regions CollectDoRegions (i+k+4)↓s
  }}}
}
•Show +´ +´¨ ×´¨¨ (⟨⟩⊸CollectMuls)¨ ⟨⟩ CollectDoRegions ss

