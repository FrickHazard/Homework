
open nat

def sub1 : ℕ → ℕ
| 0     := 0
| (x + 1) := x

def is_zero : ℕ → Prop
| 0     := true
-- works because of pattern matching
| (x + 1) := false

example : sub1 0 = 0 := rfl
example (x : ℕ) : sub1 (succ x) = x := rfl

example : is_zero 0 = true := rfl
example (x : ℕ) : is_zero (succ x) = false := rfl

example : sub1 7 = 6 := rfl
example (x : ℕ) : ¬ is_zero (x + 3) := not_false

universes u v
variables {α : Type u}  {β : Type v}

def swap_pair : α × β → β × α
| (a, b) := (b, a)

def foo : ℕ × ℕ → ℕ
| (m, n) := m + n

def bar : option ℕ → ℕ
| (some n) := n + 1
| none     := 0

def bnot1 : bool → bool
| tt := ff
| ff := tt

theorem bnot_bnot1 : ∀ (b : bool), bnot (bnot b) = b
| tt := rfl    -- proof that bnot (bnot tt) = tt
| ff := rfl    -- proof that bnot (bnot ff) = ff

example (p q : Prop) : p ∧ q → q ∧ p
| (and.intro h₁ h₂) := and.intro h₂ h₁

example (p q : Prop) : p ∨ q → q ∨ p
| (or.inl hp) := or.inr hp
| (or.inr hq) := or.inl hq

def sub2 : ℕ → ℕ
| zero            := 0
| (succ zero)     := 0
| (succ (succ a)) := a

--  once again pattern matching
def sub22 : ℕ → ℕ
| 0       := 0
| 1       := 0
| (a + 2) := a

example : sub2 = sub22 := rfl

example : sub2 0 = 0 := rfl
example : sub2 1 = 0 := rfl
example (a : nat) : sub2 (a + 2) = a := rfl

example : sub2 5 = 3 := rfl

#print sub2
#print sub2._main

example (p q : α → Prop) :
  (∃ x, p x ∨ q x) → (∃ x, p x) ∨ (∃ x, q x)
| (exists.intro x (or.inl px)) := or.inl (exists.intro x px)
| (exists.intro x (or.inr qx)) := or.inr (exists.intro x qx)

def foo1 : ℕ × ℕ → ℕ
| (0, n)     := 0
| (m+1, 0)   := 1
| (m+1, n+1) := 2

def bar1 : list ℕ → list ℕ → ℕ
| []       []       := 0
| (a :: l) []       := a
| []       (b :: l) := b
| (a :: l) (b :: m) := a + b

def band1 : bool → bool → bool
| tt a := a
| ff _ := ff

def bor1 : bool → bool → bool
| tt _ := tt
| ff a := a

def cond1 : bool → α → α → α 
| tt x y := x
| ff x y := y

-- both are treated the same
def tail1 : list α → list α
| []       := []
| (h :: t) := t

def tail2 : Π α, list α → list α
| α []       := []
| α (h :: t) := t

-- same as foo1 ↑, for overlapping patterns first one defined is used
def foo12 : ℕ → ℕ → ℕ
| 0 n := 0
| m 0 := 1
| m n := 2

-- using wild cards for a similiar effect
def foo13 : ℕ → ℕ → ℕ
| 0 _ := 0
| _ 0 := 1
| _ _ := 2

def f1 : ℕ → ℕ → ℕ
| 0  _  := 1
| _  0  := 2
| _  _  := arbitrary ℕ

variables (a b : ℕ)

example : f1 0     0     = 1 := rfl
example : f1 0     (a+1) = 1 := rfl
example : f1 (a+1) 0     = 2 := rfl
example : f1 (a+1) (b+1) = arbitrary nat := rfl

def f2 : ℕ → ℕ → option ℕ
| 0  _  := some 1
| _  0  := some 2
| _  _  := none          -- the "incomplete" case

example : f2 0     0     = some 1 := rfl
example : f2 0     (a+1) = some 1 := rfl
example : f2 (a+1) 0     = some 2 := rfl
example : f2 (a+1) (b+1) = none   := rfl

def add1 : nat → nat → nat
| m zero     := m
| m (succ n) := succ (add1 m n)

theorem add_zero1 (m : nat) : m + zero = m := rfl
theorem add_succ1 (m n : nat) : m + succ n = succ (m + n) := rfl

theorem zero_add1 : ∀ n, zero + n = n
| zero     := rfl
| (succ n) := congr_arg succ (zero_add1 n)

def mul1 : nat → nat → nat
| n zero     := zero
| n (succ m) := mul1 n m + n


theorem zero_add12 : ∀ n, add1 zero n = n
| zero     := by simp [add1]
| (succ n) := by simp [add1, zero_add12 n]

theorem zero_add13 : ∀ n, add1 zero n = n
| zero     := by rw [add1]
| (succ n) := by rw [add1, zero_add13 n]

theorem zero_add14 : ∀ n, add1 zero n = n
| zero     := by dsimp [add1]; reflexivity
| (succ n) := by dsimp [add1]; rw [zero_add14 n]

def add12 (m : nat) : nat → nat
| zero     := m
| (succ n) := succ (add12 n)

def fib : nat → nat
| 0     := 1
| 1     := 1
| (n+2) := fib (n+1) + fib n

example : fib 0 = 1 := rfl
example : fib 1 = 1 := rfl
example (n : nat) : fib (n + 2) = fib (n + 1) + fib n := rfl

example : fib 7 = 21 := rfl
example : fib 7 = 21 :=
begin
  dsimp [fib],   -- expands fib 7 as a sum of 1's
  reflexivity
end


variable (C : ℕ → Type)

#check (@nat.below C : ℕ → Type)

#reduce @nat.below C (3 : nat)

#check (@nat.brec_on C :
  Π (n : ℕ), (Π (n : ℕ), nat.below C n → C n) → C n)

def ack : nat → nat → nat
| 0     y     := y+1
| (x+1) 0     := ack x 1
| (x+1) (y+1) := ack x (ack (x+1) y)

mutual def even, odd
with even : nat → bool
| 0     := tt
| (a+1) := odd a
with odd : nat → bool
| 0     := ff
| (a+1) := even a

example (a : nat) : even (a + 1) = odd a :=
by simp [even]

example (a : nat) : odd (a + 1) = even a :=
by simp [odd]

lemma even_eq_not_odd : ∀ a, even a = bnot (odd a) :=
begin
  intro a, induction a,
  simp [even, odd],
  simp [*, even, odd]
end


inductive vector (α : Type u) : nat → Type u
| nil {} : vector 0
| cons   : Π {n}, α → vector n → vector (n+1)

namespace vector

local notation h :: t := cons h t

def map {α β γ : Type} (f : α → β → γ) :
  Π {n}, vector α n → vector β n → vector γ n
| 0     nil       nil       := nil
| (n+1) (a :: va) (b :: vb) := f a b :: map va vb

#check map._main

example (n: ℕ) (a : (vector α n)): (vector α n) :=
vector.rec_on a
(show vector α 0, from vector.nil)
(assume n itm vec ih, show vector α (succ n), from vec.cons itm) 


-- def map1 {α β γ : Type} (f : α → β → γ) :
--   Π {n}, vector α n → vector β n → vector γ n :=
-- (assume n a b, show vector γ n, from 
--     nat.rec_on n
--     (vector.nil)
--     (assume n ih, show vector γ (succ n), from ih.cons (f
--         (show α, from sorry)
--         (show β, from sorry)
--     ))
-- )    

def map1 {α β γ : Type} (f : α → β → γ) :
  Π {n}, vector α n → vector β n → vector γ n :=
(assume n a b, show vector γ n, from
    nat.rec_on n
    (show vector γ 0, from vector.nil)
    (assume n ih, show vector γ (succ n), from ih.cons (f
        (show α, from vector.rec_on a
            (show α, from sorry)
            (assume n1 itm vec ih, show α, from itm)
        )
        (show β, from sorry))
    )
)

end vector

open function

#print surjective

universes w
variables {γ : Type w}
open function

lemma surjective_comp {g : β → γ} {f : α → β}
  (hg : surjective g) (hf : surjective f) :
surjective (g ∘ f) := (assume a, show )
