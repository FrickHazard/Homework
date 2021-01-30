

variables p q r s : Prop

-- commutativity of ∧ and ∨
theorem swap_and : p ∧ q ↔ q ∧ p :=
  iff.intro
  (assume hp: p ∧ q, show q ∧ p, from and.intro (and.right hp) (and.left hp) )
  (assume hp: q ∧ p, show p ∧ q, from and.intro (and.right hp) (and.left hp) )
theorem or_swap : p ∨ q ↔ q ∨ p :=
  iff.intro
  (
    assume hp : p ∨ q, show q ∨ p, from
    or.elim
      hp
      (assume hx: p, show q ∨ p, from or.intro_right q hx )
      (assume hx: q, show q ∨ p, from or.intro_left p hx )
  )
  (
    assume hp: q ∨ p, show p ∨ q, from
    or.elim
      hp
      (assume hx: q, show p ∨ q, from or.intro_right p hx)
      (assume hx: p, show p ∨ q, from or.intro_left q hx)
  )

-- associativity of ∧ and ∨
theorem and_assoc_new : (p ∧ q) ∧ r ↔ p ∧ (q ∧ r) :=
  iff.intro
  ( 
    assume hp: (p ∧ q) ∧ r,
    show p ∧ (q ∧  r),
    from and.intro (and.left (and.left hp)) (and.intro (and.right (and.left hp)) (and.right hp) ))
  (
    assume hp: p ∧ (q ∧ r),
    show (p ∧ q) ∧ r,
    from and.intro (and.intro (and.left hp) (and.left (and.right hp))) (and.right (and.right hp))
  )

theorem or_assoc_new : (p ∨ q) ∨ r ↔ p ∨ (q ∨ r) :=
  iff.intro
  (assume hp: (p ∨ q) ∨ r,
  show p ∨ (q ∨ r),
  from or.elim hp
    (assume hx: (p ∨ q), show p ∨ (q ∨ r),
      from or.elim hx 
      (assume hz: p, show p ∨ (q ∨ r), from or.intro_left (or q r) hz )
      (assume hz: q, show p ∨ (q ∨ r), from or.intro_right p (or.intro_left r hz) )
    )
    (assume hx: r, show p ∨ (q ∨ r),
      from or.intro_right p (or.intro_right q hx)
    )
  )
  (assume hp: p ∨ (q ∨ r),
  show (p ∨ q) ∨ r,
  from or.elim hp
    (assume hx: p, show (p ∨ q) ∨ r,
      from or.intro_left r (or.intro_left q hx)
    )
    (assume hx: (q ∨ r), show (p ∨ q) ∨ r,
      from or.elim hx 
      (assume hz: q, show (p ∨ q) ∨ r, from or.intro_left r (or.intro_right p hz))
      (assume hz: r, show (p ∨ q) ∨ r, from or.intro_right (or p q) hz )
    )
  )

-- distributivity
theorem and_dist: p ∧ (q ∨ r) ↔ (p ∧ q) ∨ (p ∧ r) :=
  iff.intro (
    assume hp: p ∧ (q ∨ r),
    show (p ∧ q) ∨ (p ∧ r),
    from or.elim hp.right
      (assume hx: q, show (p ∧ q) ∨ (p ∧ r), from or.intro_left (p ∧ r) (and.intro (and.left hp) hx) )
      (assume hx: r, show (p ∧ q) ∨ (p ∧ r), from or.intro_right (p ∧ q) (and.intro (and.left hp) hx) )
  )
  (
    assume hp: (p ∧ q) ∨ (p ∧ r),
    show p ∧ (q ∨ r),
    from or.elim hp
      (assume hx: (p ∧ q), show p ∧ (q ∨ r), from and.intro (and.left hx) (or.intro_left r hx.right) )
      (assume hx: (p ∧ r), show p ∧ (q ∨ r), from and.intro (and.left hx) (or.intro_right q hx.right) )
  )

theorem or_dist : p ∨ (q ∧ r) ↔ (p ∨ q) ∧ (p ∨ r) :=
  iff.intro
  (
    assume hp: p ∨ (q ∧ r),
    show (p ∨ q) ∧ (p ∨ r),
    from or.elim hp
      (assume hx: p, show (p ∨ q) ∧ (p ∨ r), from and.intro (or.intro_left q hx) (or.intro_left r hx) )
      (assume hx: (q ∧ r), show (p ∨ q) ∧ (p ∨ r), from and.intro (or.intro_right p hx.left) (or.intro_right p hx.right))
  )
  (
    assume hp: (p ∨ q) ∧ (p ∨ r),
    show p ∨ (q ∧ r),
    from or.elim hp.left
      (assume hx: p, show p ∨ (q ∧ r), from or.intro_left (q ∧ r) hx )
      (
        assume hx: q,
        show p ∨ (q ∧ r),
        from or.elim hp.right
          (assume hz: p, show p ∨ (q ∧ r), from or.intro_left (q ∧ r) hz )
          (assume hz: r, show p ∨ (q ∧ r), from or.intro_right p (and.intro hx hz))
      )
  )

-- other properties
theorem exc_1 : (p → (q → r)) ↔ (p ∧ q → r) :=
  iff.intro
  (
    assume h1: p → (q → r),
    show (p ∧ q → r),
    from (assume h3 : p ∧ q, show r, from h1 h3.left h3.right)
  )
  (
    assume h1: p ∧ q → r,
    show (p → (q → r)),
    from (assume h2: p, show (q → r), from
      (assume h3: q, show r, from h1 (and.intro h2 h3)  ))
  )

theorem or_split: ((p ∨ q) → r) ↔ (p → r) ∧ (q → r) :=
  iff.intro
  (
    assume h1: (p ∨ q) → r,
    show (p → r) ∧ (q → r),
    from and.intro
    (assume h2: p, show r, from h1 (or.intro_left q h2) )
    (assume h2: q, show r, from h1 (or.intro_right p h2))
  )
  (
    assume h1: (p → r) ∧ (q → r),
    show (p ∨ q) → r,
    from (assume h2: p ∨ q, show r, from
      or.elim h2
      (assume h3: p, show r, from h1.left h3)
      (assume h3: q, show r, from h1.right h3)
    )
  )

theorem not_or_imp_not_and : ¬(p ∨ q) ↔ ¬p ∧ ¬q :=
  iff.intro
  (assume h1: ¬(p ∨ q), show ¬p ∧ ¬q, from 
      and.intro
      (assume h3: p, show false, from h1 (or.intro_left q h3))
      (assume h3: q, show false, from h1 (or.intro_right p h3))
  )
  (assume h1: ¬p ∧ ¬q, show ¬(p ∨ q), from
    (assume h2: p ∨ q, show false, from
      or.elim h2
      (assume h3: p, show false, from h1.left h3)
      (assume h3: q, show false, from h1.right h3)
    )
  )

example: ¬p ∨ ¬q → ¬(p ∧ q) :=
  (assume h1: ¬p ∨ ¬q, show ¬(p ∧ q), from
    assume h2: (p ∧ q), show false, from
      or.elim h1
      (assume h3: ¬p , show false, from h3 h2.left)
      (assume h3: ¬q , show false, from h3 h2.right)
  )


example : ¬(p ∧ ¬p) :=
  (assume h1: (p ∧ ¬p), show false, from 
    h1.right h1.left
  )

example : p ∧ ¬q → ¬(p → q) :=
  (assume h1: p ∧ ¬q, show ¬(p → q), from
    (assume h2: p → q, show false, from h1.right (h2 h1.left)))

example : ¬p → (p → q) := 
  (assume h1: ¬p, show (p → q), from
    (assume h2: p, show q, from false.elim (h1 h2) ))

example : (¬p ∨ q) → (p → q) := 
  (assume h1: (¬p ∨ q), show (p → q), from
    (assume h2: p, show q, from
      or.elim h1
      (assume h3: ¬p, show q, from false.elim (h3 h2))
      (assume h3: q, show q, from h3)
  ))

example : p ∨ false ↔ p :=
  iff.intro
  (assume h1: p ∨ false, show p, from
    or.elim h1
    (assume h2: p, show p, from h2)
    (assume h2: false, show p, from false.elim h2)
  )
  (assume h1: p, show p ∨ false, from or.intro_left false h1)

example : p ∧ false ↔ false :=
  iff.intro
  (assume h1: p ∧ false, show false, from false.elim h1.right)
  (assume h1: false, show p ∧ false, from false.elim h1)

example : ¬(p ↔ ¬p) :=
  assume h1: (p ↔ ¬p), show false, from
    h1.mp (h1.mpr
    ((assume h2: p → p → false, show ¬p, from
      (assume h3: p, show false, from h2 h3 h3)) h1.mp))
    (h1.mpr
    ((assume h2: p → p → false, show ¬p, from
      (assume h3: p, show false, from h2 h3 h3)) h1.mp))

example : (p → q) → (¬q → ¬p) :=
  (assume h1: (p → q), show (¬q → ¬p), from
    (assume h2: ¬q, show ¬p, from
      (assume h3: p, show false, from false.elim (h2 (h1 h3))) ) )

-- these require classical reasoning
open classical

example : (p → r ∨ s) → ((p → r) ∨ (p → s)) :=
  (assume h1: p → r ∨ s, show ((p → r) ∨ (p → s)), from
    or.elim (em r)
    (assume h2: r, show (p → r) ∨ (p → s), from or.intro_left (p → s)
      (assume h3: p, show r, from h2) )
    (assume h2: ¬r, show (p → r) ∨ (p → s), from or.intro_right (p → r)
      (assume h3: p, show s, from or.elim (h1 h3)
        (assume h4: r, show s, from false.elim (h2 h4))
        (assume h4: s, show s, from h4)
    ))
  )

example : ¬(p ∧ q) → ¬p ∨ ¬q :=
  (assume h1: ¬(p ∧ q), show ¬p ∨ ¬q, from
    or.elim (em p)
    (assume h2: p, show ¬p ∨ ¬q, from
        or.intro_right (¬p)
          ((assume h3: p, show ¬q, from
            or.elim (em q)
            (assume h4: q, show ¬q, from false.elim (h1 (and.intro h3 h4)))
            (assume h4: ¬q, show ¬q, from h4)) h2))
    (assume h2: ¬p, show ¬p ∨ ¬q, from or.intro_left (¬q) h2))

example : ¬(p → q) → p ∧ ¬q :=
  (assume h1: (p → q) → false, show p ∧ ¬q, from
    or.elim (em q)
    (assume h2: q, show p ∧ ¬q, from false.elim (h1 (assume h3: p, show q, from h2)))
    (assume h2: ¬q, show p ∧ ¬q, from
      or.elim (em p)
      (assume h3: p, show p ∧ ¬q, from and.intro h3 h2)
      (assume h3: ¬p, show p ∧ ¬q, from false.elim (h1 (assume h4: p, show q, from false.elim (h3 h4))))
    ))

example : (p → q) → (¬p ∨ q) :=
  (assume h1: (p → q), show (¬p ∨ q), from
    or.elim (em p)
    (assume h2: p, show (¬p ∨ q), from or.intro_right (¬p) (h1 h2))
    (assume h2: ¬p ,show (¬p ∨ q), from or.intro_left q h2)
  )

example : (¬q → ¬p) → (p → q) :=
  (assume h1: (¬q → ¬p), show (p → q), from
    (assume h2: p, show q, from 
    or.elim (em q)
      (assume h3: q, show q, from h3)
      (assume h3: ¬q, show q, from false.elim ((h1 h3) h2) ) ) )

example : p ∨ ¬p := (em p)

example : (((p → q) → p) → p) :=
  (assume h1: (p → q) → p, show p, from 
    or.elim (em q)
    (assume h2: q, show p, from h1 (assume h3: p, show q, from h2))
    (assume h2: ¬q, show p, from
      or.elim (em p)
      (assume h3: p, show p, from h3)
      (assume h3: ¬p, show p, from h1 (assume h4: p, show q, from false.elim (h3 h4)))
    )
  )