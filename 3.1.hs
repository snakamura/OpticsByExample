{-

action: view
path: (_1, _2)
structure: ((1, 2), 3)
focus: 2

action: set
path: (_2 . _Left)
structure: (False, Left "old")
focus: "old"

action: over
path: taking 2 worded . traversed
structure: "testing one two three"
focus: "testing one"

action: foldOf
path: both . each
structure: (["super", "cali"], ["fragilistic", "expialidocious"])
focus: "super", "cali", "fragilistic", "expialidocious"

-}