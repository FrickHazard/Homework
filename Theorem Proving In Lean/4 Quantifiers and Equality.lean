variables (α : Type) (p q : α → Prop)
variable r: Prop

example : (∀ x, p x ∧ q x) ↔ (∀ x, p x) ∧ (∀ x, q x) :=
    iff.intro 
    (assume h1: ∀x, p x ∧ q x, show (∀x, p x) ∧ (∀ x, q x), from
        and.intro
        (assume h2: α, show p h2, from (h1 h2).left)
        (assume h2: α, show q h2, from (h1 h2).right))
    (assume h1: (∀ x, p x) ∧ (∀ x, q x), show ∀x, p x ∧ q x, from 
        (assume h2: α, show p h2 ∧ q h2, from
            and.intro
            (h1.left h2)
            (h1.right h2)))

example : (∀ x, p x → q x) → (∀ x, p x) → (∀ x, q x) :=
  assume h1: (∀ x, p x → q x), show (∀ x, p x) → (∀ x, q x), from
    assume h2: (∀ x, p x), show (∀ x, q x), from
      assume h3: α, show q h3, from (h1 h3) (h2 h3)

-- reason for one way. If all frogs are either red or green, then every frog is either red or green.from
-- If all frogs are either green or red, it cannot be said that all frogs are green
-- or all frogs are red
example : (∀ x, p x) ∨ (∀ x, q x) → ∀ x, p x ∨ q x :=
  (assume h1: (∀ x, p x) ∨ (∀ x, q x), show (∀ x, p x ∨ q x), from
    or.elim h1
    (assume h2: (∀ x, p x), show (∀ x, p x ∨ q x), from
      assume h3: α, show p h3 ∨ q h3, from or.intro_left (q h3) (h2 h3) )
    (assume h2: (∀ x, q x), show (∀ x, p x ∨ q x), from
      assume h3: α, show p h3 ∨ q h3, from or.intro_right (p h3) (h2 h3)))

example : α → ((∀ x : α, r) ↔ r) :=
  assume h1: α, show ((∀ x : α, r) ↔ r), from
    iff.intro
    (assume h2: ∀ x : α, r, show r, from h2 h1)
    (assume h2: r, show ∀ x: α, r, from 
      (assume h3: α, show r, from h2))

open classical

example : (∀ x, p x ∨ r) ↔ (∀ x, p x) ∨ r :=
  iff.intro
  (assume h1: ∀ x, p x ∨ r, show (∀ x, p x) ∨ r, from
    or.elim (em r)
    (assume h2: r, show (∀ x, p x) ∨ r,  from or.intro_right (∀ x, p x) h2)
    (assume h2: ¬r, show (∀ x, p x) ∨ r, from or.intro_left r
      (assume h3: α, show p h3, from
        or.elim (h1 h3)
        (assume h4: p h3, show p h3, from h4)
        (assume h4: r, show p h3, from false.elim (h2 h4)))))
  (assume h1: (∀ x, p x) ∨ r, show (∀ x, p x ∨ r), from 
    (assume h2: α, show p h2 ∨ r, from
      or.elim h1
      (assume h3: ∀ x, p x, show p h2 ∨ r, from or.intro_left r (h3 h2))
      (assume h3: r, show p h2 ∨ r, from or.intro_right (p h2) h3 )))

example : (∀ x, r → p x) ↔ (r → ∀ x, p x) :=
  iff.intro
  (assume h1: ∀ x, r → p x, show (r → ∀ x, p x), from
    (assume h2: r, show ∀ x, p x, from 
      (assume h3: α, show p h3, from h1 h3 h2)))
  (assume h1: r → ∀ x, p x, show ∀ x, r → p x, from
    assume h2: α, show r → p h2, from
      assume h3: r, show p h2, from h1 h3 h2)

variables (men : Type) (barber : men)
variable  (shaves : men → men → Prop)
-- em not nesscary
example (h : ∀ x : men, shaves barber x ↔ ¬shaves x x) : false :=
  or.elim (em (shaves barber barber))
  (assume h1: shaves barber barber, show false, from
    (h barber).mp h1 h1)
  (assume h1: ¬shaves barber barber, show false, from
    (h barber).mp
    ((h barber).mpr h1)
    ((h barber).mpr h1))

namespace hidden

def divides (m n : ℕ) : Prop := ∃ k, m * k = n

instance : has_dvd nat := ⟨divides⟩

def even (n : ℕ) : Prop := 2 ∣ n -- You can enter the '∣' character by typing \mid
def odd (n: ℕ) : Prop := ¬(even n)

section
  variables m n : ℕ

  #check m ∣ n
  #check m^n
  #check even (m^n +3)
end

def prime (n : ℕ) : Prop := (n > 1) ∧ (∀ k : ℕ, (k ∣ n) → (k = 1) ∨ (n = k))

def infinitely_many_primes : Prop := ∀ n : ℕ, ∃ k : ℕ, (prime k) ∧ (k > n)     

def Fermat_prime (n : ℕ) : Prop := prime ((2 ^ 2 ^ n) + 1)

def infinitely_many_Fermat_primes : Prop := ∀ n : ℕ, ∃ k : ℕ, (Fermat_prime k) ∧ (k > n)

def goldbach_conjecture : Prop := ∀ n: ℕ, (even n) → (n > 2) → 
    (∃ a b : ℕ, (a + b = n) ∧ (prime a) ∧ (prime b))

def Goldbach's_weak_conjecture : Prop := ∀ n : ℕ, ¬(even n) → (n > 5) → 
    (∃ a b c, ((a + b + c) = n) ∧ (prime a) ∧ (prime b) ∧ (prime c) )

def Fermat's_last_theorem : Prop := ∀ a b c n: ℕ, (n > 2) ∧ ¬(a^n + b^n = c^n)

end hidden

variable a : α

example : (∃ x : α, r) → r :=
(assume h1: (∃ x: α, r), show r, from exists.elim h1
    (assume h2: α, show r → r, from
        (assume h3: r, show r , from h3)))

example : r → (∃ x : α, r) :=
(assume h1: r, show (∃ x : α, r), from exists.intro a h1)

example : (∃ x, p x ∧ r) ↔ (∃ x, p x) ∧ r :=
    iff.intro
    (assume ⟨w, hpw, hqw⟩, and.intro ⟨w,hpw⟩ hqw)
    (assume h1: (∃ x, p x) ∧ r, show (∃ x, p x ∧ r), from 
        (match h1.left with ⟨w, hpw⟩ := ⟨w, hpw, h1.right⟩ end))

example : (∃ x, p x ∨ q x) ↔ (∃ x, p x) ∨ (∃ x, q x) :=
    iff.intro
    (assume h1: (∃ x, p x ∨ q x), show (∃ x, p x) ∨ (∃ x, q x), from
        (match h1 with ⟨w, hpw⟩ :=
            or.elim hpw
            (assume h2: p w, show (∃ x, p x) ∨ (∃ x, q x), from or.intro_left (∃ x, q x) ⟨w, h2⟩)
            (assume h2: q w, show (∃ x, p x) ∨ (∃ x, q x), from or.intro_right (∃ x, p x) ⟨w, h2⟩) end))

    (assume h1: (∃ x, p x) ∨ (∃ x, q x), show (∃ x, p x ∨ q x), from
        or.elim h1
        (assume h1: ∃ x, p x, show (∃ x, p x ∨ q x), from
            (match h1 with ⟨w, h2⟩ := ⟨w, (or.intro_left (q w) h2) ⟩ end ))
        (assume h1: ∃ x, q x, show (∃ x, p x ∨ q x), from
            (match h1 with ⟨w, h2⟩ := ⟨w, (or.intro_right (p w) h2 )⟩ end )))

-- exlcude middle not needed? I think it is
example : (∀ x, p x) ↔ ¬ (∃ x, ¬ p x) :=
iff.intro
    (assume h1: ∀ x, p x, show ¬ (∃ x, ¬ p x), from
        (assume h2: ∃ x, ¬ p x, show false, from match h2 with ⟨w, h3⟩ := h3 (h1 w) end ))
    (assume h1: ¬(∃ x, ¬ p x), show (∀ x, p x), from
        (assume h2: α, show p h2, from
        or.elim (em (p h2))
        (assume h3: (p h2), show (p h2), from h3)
        (assume h3: ¬(p h2), show (p h2), from false.elim (h1 (exists.intro h2
            (assume h5: p h2, show false, from h3 h5))))))

example : (∃ x, p x) ↔ ¬ (∀ x, ¬ p x) :=
    iff.intro
    (assume h1: ∃ x, p x, show ¬(∀ x, ¬ p x), from
        (assume h2: (∀ x, ¬ p x), show false, from
            (match h1 with ⟨w, wh⟩ := (h2 w) wh end)))
    (assume h1: ¬(∀ x, ¬ p x), show ∃ x, p x, from
        or.elim (em (∃ x, p x))
        (assume h2: ∃ x, p x, show ∃ x, p x, from h2)
        (assume h2: ¬(∃ x, p x), show ∃ x, p x, from
            false.elim (h1 (assume h3: α, show ¬ p h3, from
                (assume h4: (p h3), show false, from
                    h2 (exists.intro h3 h4))  ))))

example : (¬ ∃ x, p x) ↔ (∀ x, ¬ p x) :=
    iff.intro
    (assume h1: ¬ ∃ x, p x, show ∀ x, ¬ p x, from
        (assume h2: α, show ¬ p h2, from 
            (assume h3: p h2, show false, from
                h1 (exists.intro h2 h3))))
    (assume h1: ∀ x, ¬ p x, show ¬ ∃ x, p x, from
        (assume h2: ∃ x, p x, show false, from
            (match h2 with ⟨w, wq⟩ := (h1 w) wq end)))

example : (¬ ∀ x, p x) ↔ (∃ x, ¬ p x) :=
    iff.intro
    (assume h1: ¬ ∀ x, p x, show ∃ x, ¬ p x, from
        or.elim (em (∃ x, ¬ p x))
        (assume h2:   ∃ x, ¬ p x, show ∃ x, ¬ p x, from h2)
        (assume h2: ¬ ∃ x, ¬ p x, show ∃ x, ¬ p x, from
            false.elim (h1 (assume h3: α, show p h3, from 
            or.elim (em (p h3)) 
            (assume h4: p h3, show p h3, from h4)
            (assume h4: ¬ p h3, show p h3, from
                false.elim (h2 (exists.intro h3 h4)))))))
    (assume h1: ∃ x, ¬ p x, show ¬ ∀ x, p x, from
        (assume h2: ∀ x, p x, show false, from
            (match h1 with ⟨w, wq⟩  := wq (h2 w) end )))

example : (∀ x, p x → r) ↔ (∃ x, p x) → r :=
    iff.intro
    (assume h1: (∀ x, p x → r), show (∃ x, p x) → r, from
        (assume h2: ∃ x, p x, show r, from (match h2 with ⟨w, wh⟩ := (h1 w) wh end )))
    (assume h1: (∃ x, p x) → r, show (∀ x, p x → r), from
        (assume h2: α, show p h2 → r, from
            (assume h3 : p h2, show r, from h1 (exists.intro h2 h3) )))

example : (∃ x, p x → r) ↔ (∀ x, p x) → r :=
    iff.intro
    (assume h1: (∃ x, p x → r), show (∀ x, p x) → r, from
        (assume h2: ∀ x, p x, show r, from (match h1 with ⟨w, wh⟩ := wh (h2 w) end)))
    (assume h1: (∀ x, p x) → r, show (∃ x, p x → r), from
        or.elim (em (∀ x, p x))
        (assume h2: ∀ x, p x, show ∃ x, p x → r, from exists.intro a
            (assume h3: p a, show r, from (h1 h2)))
        (assume h2: ¬ ∀ x, p x, show ∃ x, p x → r, from
            or.elim (em ∃ x, p x → r)
            (assume h3: ∃ x, p x → r, show ∃ x, p x → r, from h3)
            (assume h3: ¬ (∃ x, p x → r), show (∃ x, p x → r), from 
                false.elim (h2 (assume h4: α, show p h4, from
                    or.elim (em (p h4))
                    (assume h5: p h4, show p h4, from h5)
                    (assume h5: ¬ p h4, show p h4, from
                        false.elim (h3 (exists.intro h4
                            (assume h6: p h4, show r, from false.elim (h5 h6))))))))))

example : (∃ x, r → p x) ↔ (r → ∃ x, p x) :=
    iff.intro
    (assume h1: ∃ x, r → p x, show r → ∃ x, p x, from
        (match h1 with ⟨w, wq⟩ :=
            (assume h2: r, show ∃ x, p x, from exists.intro w (wq h2)) end ))
    (assume h1: r → ∃ x, p x, show ∃ x, r → p x, from
         or.elim (em (∃ x, r → p x))
            (assume h3: ∃ x, r → p x, show ∃ x, r → p x, from h3)
            (assume h3: ¬ ∃ x, r → p x, show ∃ x, r → p x, from
                exists.intro a
                    (assume h2: r, show p a, from 
                        match (h1 h2) with ⟨w, wq⟩ := false.elim (h3 (exists.intro w (assume h4: r, show p w, from wq))) end)))

variables (real: Type) [ordered_ring real]
variables (log exp   : real → real)
variables log_exp_eq : ∀ x, log (exp x) = x
variables exp_log_eq : ∀ {x}, x > 0 →  exp (log x) = x
variables exp_pos    : ∀ x, exp x > 0
variables exp_add    : ∀ x y, exp( x + y) = exp x * exp y

include log_exp_eq exp_log_eq exp_pos exp_add

example (x y z : real) :
    exp (x + y + z) = exp x * exp y * exp z :=
    by rw [exp_add, exp_add]

example (y: real) (h: y > 0)  : exp (log y) = y :=
exp_log_eq h

theorem log_mul {x y : real} (hx : x > 0)  (hy : y > 0) :
    log (x * y) = log x + log y :=
    eq.symm
      (calc
        log x + log y = log x + log y : eq.refl (log x + log y)
        ...           = log(exp(log x + log y))   : by rw log_exp_eq
        ...           = log(exp(log x) * exp(log y))  : by rw (exp_add (log x) (log y))
        ...           = log(x * y) : by rw [(exp_log_eq hx), (exp_log_eq hy)])


#check sub_self

example (x : ℤ) : x * 0 = 0 :=
    calc x * 0 = x * 0 : eq.refl (x * 0)
        ...    = x * (x - x) : by rw [sub_self]
        ...    = x * x - x * x : by rw mul_sub
        ...    = 0 : by rw sub_self 