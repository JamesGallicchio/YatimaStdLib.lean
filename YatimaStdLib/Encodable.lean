/--
`Encodable α δ` means that `α` is encodable into a data format `δ` with some 
injection `encode : α → δ`. It also provides a partial function
`decode : δ → Except String α` that may throw errors for terms of `δ` without
preimage.

TODO: add deriving macros
-/
class Encodable (α : Type _) (δ : Type _) where
  encode : α → δ
  decode : δ → Except String α

/-- Any `Encodable α δ` instance gives us a trivial `Coe α δ` instance -/
instance [Encodable α δ] : CoeTC α δ := ⟨Encodable.encode⟩
