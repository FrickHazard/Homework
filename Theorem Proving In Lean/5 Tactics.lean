import init.data.list

theorem test (p q : Prop) (hp: p) (hq: q):  p ∧ q ∧ p :=
    begin
        apply and.intro hp,
        exact and.intro hq hp
    end

example (α : Type) : α → α :=
begin 
    intro a,
    exact a
end

example (α : Type) : ∀ x: α , x = x :=
    begin
        intro x,
        exact eq.refl x,
    end

example : ∀ a b c : ℕ, a = b → a = c → c = b :=
    begin
        intros a b c h₁ h₂,
        exact eq.trans (eq.symm h₂) h₁
    end 

variables x y z w : ℕ

example (h₁ : x = y) (h₂: y = z) (h₃ : z = w) : x = w :=
    begin
        apply eq.trans h₁,
        apply eq.trans h₂,
        assumption
    end

example (h₁ : x = y) (h₂ : y = z) (h₃ : z = w) : x = w :=
begin
    apply eq.trans,
    assumption,
    apply eq.trans,
    assumption,
    assumption
end

example : ∀ a b c : ℕ, a = b → a = c → c = b :=
    begin
        intros,
        apply eq.trans,
        apply eq.symm,
        assumption,
        assumption
    end

example (y : ℕ) : (λ x : ℕ, 0) y = 0 :=
    begin
        refl
    end

example (x : ℕ) : x ≤ x :=
    begin
        refl
    end

example : ∀ a b c : ℕ, a = b → a = c → c = b :=
    begin
        intros,
        transitivity,
        symmetry,
        repeat { assumption }        
    end

-- ∃ means there exists whatever follows


example : ∃ a : ℕ, 5 = a :=
    begin
        apply exists.intro,
        reflexivity
    end    

example : ∃ a : ℕ, a = a :=
    begin
        fapply exists.intro,
        exact 4,
        reflexivity
    end

example (x : ℕ) : x = x :=
    begin
        revert x,
        intro y,
        reflexivity
    end

example (x y : ℕ) (h : x = y) : y = x :=
    begin
        revert h,
        intro h₁,
        symmetry,
        assumption        
    end

example (x y : ℕ) (h : x = y) : y = x :=
    begin
        revert x,
        intros,
        symmetry,
        assumption
    end

example : 3 = 3 :=
begin
    generalize: 3 = x,
    revert x,
    intro y,
    reflexivity
end

-- loss of information
example : 2 + 3 = 5 :=
begin
    generalize : 3 = x,
    sorry
end

example : 2 + 3 = 5 :=
begin
    generalize h : 3 = x,
    rw ←h 
end

example (p q : Prop): p ∨ q → q ∨ p :=
begin
    intro h,
    cases h with hp hq,
    right, exact hp,
    left, exact hq
end

example (p q : Prop) : p ∧ q → q ∧ p :=
begin
    intro h,
    cases h with hp hq,
    constructor, exact hq, exact hp
end

example (p q r : Prop) : p ∧ (q ∨ r) ↔ (p ∧ q) ∨ (p ∧ r) :=
begin
    apply iff.intro,
    intro h,
      cases h with hp hqr,
      cases hqr with hq hr,
        left, constructor, repeat { assumption },
        right, constructor, repeat { assumption },
    intro h,
      cases h with hpq hpr,
        cases hpq  with hp hq,
            constructor, exact hp, left, exact hq,
        cases hpr with hp hr,
            constructor, exact hp, right, exact hr 
end

example (p q : ℕ → Prop) : (∃ x, p x) → ∃ x, p x ∨ q x :=
begin
    intro h,
    cases h with x px,
    constructor, left, exact px
end

example (p q : ℕ  → Prop) :
    (∃ x, p x ∧ q x) → (∃ x, q x ∧ p x) :=
begin
intro h,
cases h with x hpq,
cases hpq with hp hq,
existsi x,
split; assumption
end

universes u v
def swap_pair {α : Type u} {β  : Type v} : α × β → β × α :=
begin
    intro p,
    cases p with ha hb,
    constructor, exact hb, exact ha
end

def swap_sum {α : Type u} {β : Type v} : α ⊕ β  → β ⊕ α  :=
begin
    intro p,
    cases p with ha hb,
        right, exact ha,
        left, exact hb,
end

example (P : ℕ → Prop) (h₀ : P 0) (h₁ : ∀ (n : ℕ), P (nat.succ n)) (m: ℕ) :
P m :=
begin
    cases m with m', exact h₀, exact h₁ m'
end

example (p q : Prop) : p ∧  ¬p → q :=
begin
    intro h, cases h, contradiction
end

-- multiple versions of the same theroem
example (p q r : Prop) : p ∧ (q ∨ r) → (p ∧ q) ∨ (p ∧ r) :=
begin
intro h,
exact
    have hp : p, from h.left,
    have hqr : q ∨ r, from h.right,
    show (p ∧ q) ∨ (p ∧ r),
    begin
    cases hqr with hq hr,
        exact or.inl ⟨hp, hq⟩,
    exact or.inr ⟨hp, hr⟩  
    end
end

example (p q r: Prop) : p ∧ (q ∨ r) ↔ (p ∧ q) ∨ (p ∧ r) :=
begin
    apply iff.intro,
        intro h,
            cases h.right with hq hr,
                exact or.inl ⟨h.left, hq⟩,
            exact or.inr ⟨h.left, hr⟩,
        intro h,
            cases h with hpq hpr,
                exact ⟨hpq.left, or.inl hpq.right ⟩ ,
            exact ⟨hpr.left, or.inr hpr.right⟩ 
end

example (p q r: Prop): p ∧ (q ∨ r) ↔ (p ∧ q) ∨ (p ∧ r) :=
begin
apply iff.intro,
    intro h,
    cases h.right with hq hr,
    show (p ∧ q) ∨ (p ∧ r),
        { left, split, exact h.left, assumption },
    show (p ∧ q) ∨ (p ∧ r),
        { right, split, exact h.left, assumption },
    intro h,
    cases h with hpq hpr,
    show p ∧ (q ∨ r),
        { cases hpq, split, assumption, left, assumption }, 
    show p ∧ (q ∨ r),
        { cases hpr, split, assumption, right, assumption}
end

example (n: ℕ) : n + 1 = nat.succ n :=
begin
    show nat.succ n = nat.succ n,
    reflexivity
end

-- show can select which goal to address, both proofs below are equivlent
example (p q : Prop): p ∧ q → q ∧ p :=
begin
    intro h,
    cases h with hp hq,
    split,
    show q, from hq,
    show p, from hp
end

example (p q: Prop): p ∧ q → q ∧ p :=
begin
    intro h,
    cases h with hp hq,
    split,
    show p, from hp,
    show q, from hq
end

-- have rewrite subgoal
example (p q r: Prop) : p ∧ (q ∨ r) → (p ∧ q) ∨ (p ∧ r) :=
begin
    intro h,
    cases h with hp hqr,
    show (p ∧ q) ∨ (p ∧ r),
        cases hqr with hq hr,
        have hpq: p ∧ q,
            from and.intro hp hq,
        left, exact hpq,
    have hpr : p ∧ r,
        from and.intro hp hr,
        right, exact hpr
end

example (p q r : Prop) : p ∧ (q ∨ r) → (p ∧ q) ∨ (p ∧ r) :=
begin
    intro h,
    cases h with hp hqr,
    show (p ∧ q) ∨ (p ∧ r),
    cases hqr with hq hr,
    have hpq: p ∧ q,
        split; assumption,
        left, exact hpq,
    have hpr: p ∧ r,
    split; assumption,
    right, exact hpr
end

-- this for ommited label for subgoal
example (p q r: Prop): p ∧ (q ∨ r) → (p ∧ q) ∨ (p ∧ r) :=
begin
intro h,
cases h with hp hqr,
show (p ∧ q) ∨ (p ∧ r),
cases hqr with hq hr,
    have : p ∧ q,
        split; assumption, left, exact this,
    have : p ∧ r,
    split; assumption,
    right, exact this,
end

example (p q r : Prop): p ∧ (q ∨ r) → (p ∧ q) ∨ (p ∧ r) :=
begin
    intro h,
    have hp : p := h.left,
    have hqr : q ∨ r := h.right,
        show (p ∧ q) ∨ (p ∧ r),
        cases hqr with hq hr,
            exact or.inl ⟨hp, hq⟩,
        exact or.inr ⟨hp, hr⟩  
end

example : ∃ x, x + 2 = 8 :=
begin
    let a: ℕ :=3 *2,
    existsi a,
    reflexivity
end

example (p q r: Prop) : p ∧ (q ∨ r) ↔ (p ∧ q) ∨ (p ∧ r) :=
begin
    apply iff.intro,
    begin
        intro h,
        cases h.right with hq hr,
        begin
            show (p ∧ q) ∨ (p ∧ r),
            exact or.inl ⟨h.left, hq⟩  
        end,
        show (p ∧ q) ∨ (p ∧ r),
            exact or.inr ⟨h.left, hr⟩ 
    end,
    intro h,
    cases h with hpq hpr,
    begin
        show p ∧ (q ∨ r),
            exact ⟨hpq.left, or.inl hpq.right⟩ 
    end,
    show p ∧ (q ∨ r),
        exact ⟨hpr.left, or.inr hpr.right⟩ 
end

-- curly braces are equivilent to begin end
example (p q r: Prop) : p ∧ (q ∨ r) ↔ (p ∧ q) ∨ (p ∧ r) :=
begin
    apply iff.intro,
    {
        intro h,
        cases h.right with hq hr,
        { show (p ∧ q) ∨ (p ∧ r),
            exact or.inl ⟨h.left, hq ⟩ },
        show (p ∧ q) ∨ (p ∧ r),
            exact or.inr ⟨h.left, hr⟩ },
    intro h,
    cases h with hpq hpr, 
    {
        show p ∧ (q ∨ r),
            exact ⟨hpq.left, or.inl hpq.right⟩ },
    show p ∧ (q ∨ r),
        exact ⟨hpr.left, or.inr hpr.right⟩ 
end

example (p q : Prop) (hp : p) : p ∨ q :=
begin left, assumption end

example (p q : Prop) (hp : p) : p ∨ q :=
by { left, assumption }

example (p q : Prop) (hp : p) (hq : q) : p ∧ q :=
by split; assumption

example (p q : Prop) (hp : p) : p ∨ q :=
by { left, assumption } <|> { right, assumption}

example (p q : Prop) (hq : q) : p ∨ q :=
by { left, assumption } <|> { right, assumption}

example (p q r: Prop) (hp : p) : p ∨ q ∨ r :=
by repeat { {left, assumption} <|> right <|> assumption}

example (p q r: Prop) (hq : q) : p ∨ q ∨ r :=
by repeat { { left, assumption} <|> right <|> assumption }

example (p q r: Prop) (hr : r) : p ∨ q ∨ r :=
by repeat { { left, assumption} <|> right <|> assumption }

meta def my_tac : tactic unit :=
`[repeat { { left, assumption } <|> right <|> assumption }]

example (p q r : Prop) (hp : p) : p ∨ q ∨ r :=
by my_tac

example (p q r : Prop) (hq : q) : p ∨ q ∨ r :=
by my_tac

example (p q r : Prop) (hr : r) : p ∨ q ∨ r :=
by my_tac

example (p q r : Prop) (hp : p) (hq : q) (hr : r) :
  p ∧ q ∧ r:=
begin
  split,
  any_goals  { split },
  any_goals  { assumption }
end

example (p q r : Prop) (hp : p) (hq : q) (hr : r) :
  p ∧ ((p ∧ q) ∧ r) ∧ (q ∧ r ∧ p) :=
begin
  repeat { any_goals { split }},
  all_goals { assumption }
end

example (p q r : Prop) (hp : p) (hq : q) (hr : r) :
  p ∧ ((p ∧ q) ∧ r) ∧ (q ∧ r ∧ p) :=
by repeat { any_goals { split <|> assumption} }

example  (f: ℕ → ℕ) (k: ℕ) (h₁ : f 0 = 0) (h₂ : k = 0) : f k = 0 :=
begin
    rw h₂,
    rw h₁
end

example (x y : ℕ) (p : ℕ → Prop) (q : Prop) (h : q → x = y)
  (h' : p y) (hq : q) : p x :=
by
{
    rw (h hq),
    assumption
}

-- [] repeats a rw operation
example  (f: ℕ → ℕ) (k: ℕ)
(h₁ : f 0 = 0) (h₂ : k = 0) : f k = 0 :=
by rw [h₂, h₁]

example (a b : ℕ) (f: ℕ → ℕ) (h₁ : a = b) 
(h₂ : f a = 0) : f b = 0 :=
begin
  rw [←h₁, h₂]
end

example (a b c : ℕ) : a + b + c = a + c + b :=
by
{
    rw [add_assoc, add_comm b, ←add_assoc]
}

example (a b c : ℕ) : a + b + c = a + c + b :=
by
{
    rw [add_assoc, add_assoc, add_comm b]
}

example (a b c : ℕ) : a + b + c = a + c + b :=
by
{
  rw [add_assoc, add_assoc, add_comm _ b]
}

example (a b : ℕ) (f: ℕ → ℕ) (h : a + 0 = 0) : f a = f 0 :=
by { rw add_zero at h, rw h }

def tuple (α : Type u) (n : ℕ) :=
  { l : list α // list.length l = n }

example {α : Type u} {n : ℕ}
(h : n = 0) (t : tuple α n) : tuple α 0 :=
begin
  rw h at t,
  exact t
end

example {α : Type u} [ring α] (a b c : α) :
  a * 0 + 0 * b + c * 0 + 0 * a = 0 :=
begin
  rw [mul_zero, mul_zero, zero_mul, zero_mul],
  repeat { rw add_zero }
end

example {α : Type u} [group α] {a b : α} (h : a * b = 1) :
  a⁻¹ = b :=
by rw [←(mul_one a⁻¹), ←h, inv_mul_cancel_left]

example (x y z : ℕ) :  (x + 0) * (0 + y * 1 + z * 0) = x * y :=
by simp

example (x y z : ℕ) (p : ℕ → Prop) (h : p (x * y)) :
p ((x + 0) * (0 + y * 1 + z * 0)) :=
by { simp, assumption }


-- open list

-- example (xs : list ℕ) :
--   reverse (xs ++ [1, 2, 3]) = [3, 2, 1] ++ reverse xs :=
-- by simp

-- example {α : Type u} (xs ys : list α) :
--   length (reverse (xs ++ ys)) = length xs + length ys :=
-- by simp

example (x y z : ℕ) (p : ℕ → Prop) (h : p (x * y))
(h : p ((x + 0) * (0 + y * 1 + z * 0))) :
  p (x * y) :=
by { simp at h, assumption }


local attribute [simp] mul_comm mul_assoc mul_left_comm

example (w x y z : ℕ) (p : ℕ → Prop)
(h : p (x * y + z * w  * x)) :
p (x * w * z + y * x) :=
by { simp at *, assumption }

example (w x y z : ℕ) (p : ℕ → Prop)
(h₁ : p (1 * x + y)) (h₂ : p  (x * z * 1)) :
p (y + 0 + x) ∧ p (z * x) :=
by { simp at *, split; assumption }

example (w x y z : ℕ) (p : ℕ → Prop):
 x * y + z * w  * x = x * w * z + y * x :=
by simp

example (w x y z : ℕ) (p : ℕ → Prop)(h : p (x * y + z * w  * x)) :
p (x * w * z + y * x) :=
begin simp, simp at h, assumption end

-- excercises

-- intro, intros
-- revert
-- exact
-- cases
-- right
-- left
-- reflexivity
-- repeat
-- assumption
-- apply, eq.trans eq.symm exists.intro
-- fapply
-- 3
-- generalize
-- rw rewrite
variables p q r s : Prop
example : p ∧ q ↔ q ∧ p := by
{
    apply iff.intro,
    {
        intro h,
        have hp : p := h.left,
        have hq : q := h.right,
        show q ∧ p,
            exact ⟨hq, hp⟩ 
    },
    {
        intro h,
        have hq : q := h.left,
        have hp : p := h.right,
        show p ∧ q,
            exact ⟨hp, hq⟩ 
    },
}

example : p ∨ q ↔ q ∨ p := by
{
    apply iff.intro,
    {
        intro h,
        cases h with hp hq,
        right, exact hp,
        left, exact hq,
    },
    {
        intro h,
        cases h with hq hp,
        right, exact hq,
        left, exact hp
    }
}

example : (p ∧ q) ∧ r ↔ p ∧ (q ∧ r) := by
{
    apply iff.intro,
    {
        intro h,
        cases h with hpq hr,
        exact ⟨hpq.left, ⟨hpq.right, hr⟩⟩
    },
    {
        intro h,
        cases h with hp hqr,
        exact ⟨⟨hp, hqr.left⟩, hqr.right⟩ 
    }
}

example : (p ∨ q) ∨ r ↔ p ∨ (q ∨ r) := by
{
    apply iff.intro,
    {
        intro h,
        cases h with hpq hr,    
        cases hpq with hp hq,
        left, exact hp,
        right, exact or.intro_left r hq,
        right, exact or.intro_right q hr
    },
    {
        intro h,
        cases h with hp hqr,
        left, exact (or.intro_left q hp),
        cases hqr with hq hr,
        left, right, exact hq,
        right, exact hr
    }
} 

example : p ∧ (q ∨ r) ↔ (p ∧ q) ∨ (p ∧ r) := by
{
    apply iff.intro,
    {
        intro h,
        cases h with hp hqr,
        cases hqr with hq hr,
        left, exact ⟨hp,hq⟩,
        right, exact ⟨hp, hr⟩ 
    },
    {
        intro h,
        cases h with hpq hpr,
        exact ⟨hpq.left, or.inl hpq.right⟩,
        exact ⟨hpr.left, or.inr hpr.right⟩  
    }
}

example : p ∨ (q ∧ r) ↔ (p ∨ q) ∧ (p ∨ r) := by
{
    apply iff.intro,
    {
        intro h,
        cases h with hp hqr,
        exact ⟨or.inl hp, or.inl hp⟩,
        exact ⟨or.inr hqr.left, or.inr hqr.right⟩  
    },
    {
        intro h,
        cases h with hpq hpr,
        cases hpq with hp hq,
        left, exact hp,
        cases hpr with hp hr,
        left, exact hp,
        right, exact ⟨hq, hr⟩ 
    }
}

example : (p → (q → r)) ↔ (p ∧ q → r) := by
{
    apply iff.intro,
    {
        intro h₁,
        intro h₂,
        exact h₁ h₂.left h₂.right  
    },
    {
        intro h₁,
        intro h₂,
        intro h₃,
        exact h₁ ⟨h₂, h₃⟩ 
    }
}

example : ((p ∨ q) → r) ↔ (p → r) ∧ (q → r) := by
{
    apply iff.intro,
    {
        intro h,
        apply and.intro,
            intro hp,
            exact h (or.inl hp),
            intro hq,
            exact h (or.inr hq)
    },
    {
        intro h₁,
        intro h₂,
        apply or.elim h₂,
            intro hp,
            exact h₁.left hp,
            intro hq,
            exact h₁.right hq,
    }
}

example : ¬(p ∨ q) ↔ ¬p ∧ ¬q := by
{
    apply iff.intro,
    {
        intro h,
        apply and.intro,
        intro hp,
        exact h (or.inl hp),
        intro hq,
        exact h (or.inr hq),
    },
    {
        intro h₁,
        intro h₂,
        apply or.elim h₂,
        intro hp,
        exact h₁.left hp,
        intro hq,
        exact h₁.right hq  
    }
}

example : ¬p ∨ ¬q → ¬(p ∧ q) := by
{
    intro h,
    cases h with hnp hnq,
    intro h2,
        exact hnp h2.left,
    intro h2,
        exact hnq h2.right
}

example : ¬(p ∧ ¬p) := by
{
    intro h,
    exact h.right h.left
}

example : p ∧ ¬q → ¬(p → q) := by
{
    intro h,
    intro h2,
    exact h.right (h2 h.left)
} 

example : ¬p → (p → q) := by
{
    intro h,
    intro hp,
    apply false.elim,
    exact h hp
}

example : (¬p ∨ q) → (p → q) := by
{
    intro h,
    intro hp,
    cases h with hnp hq,
        apply false.elim,
        exact hnp hp,
    exact hq,
}

example : (p ∨ false) ↔  p := by
{
    apply iff.intro,
    {
        intro h,
        cases h with hp hfalse,
        exact hp,
        apply false.elim,
        exact hfalse
    },
    {
        intro h,
        exact or.inl h
    }
}

example : p ∧ false ↔ false := by
{
    apply iff.intro,
    {
        intro h,
        apply false.elim,
        exact h.right
    },
    {
        intro h,
        apply false.elim,
        exact h
    }
} 

example : ¬(p ↔ ¬p) := by
{
    intro h,
    apply h.mp,
    repeat
    {
        apply h.mpr,
        intro hp,
        exact h.mp hp hp,
    }
}

example : (p → q) → (¬q → ¬p) := by
{
    intro h,
    intro h2,
    intro h3,
    exact h2 (h h3)
}

-- classical section 3
open classical
example : (p → r ∨ s) → (p → r) ∨ (p → s) := by 
{
    intro h,
    apply or.elim (em r),
    intro hr,
        left,
        intro hp,
        exact hr,
    intro hnr,
        right,
        intro hp,
        apply or.elim (h hp),
            intro hr,
            apply false.elim,
        exact hnr hr,
            intro hs,
        exact hs
}

example : ¬(p ∧ q) → ¬p ∨ ¬q := by 
{
    intro h,
    apply or.elim (em p),
    apply or.elim (em q),

    intros hq hp,
        apply false.elim,
        exact h ⟨hp, hq⟩,
    intros hnq hp,
        exact or.inr hnq,
    intros hnp,
        exact or.inl hnp,
}

example : ¬(p → q) → (p ∧ ¬q) := by
{
    intro h,
    
    apply or.elim (em q),
    intro hq,
        apply false.elim,
        apply h,
        intro hp,
        exact hq,
        
    intro hnq,
        apply or.elim (em (p)),
        intro hp,
            exact ⟨hp, hnq⟩,
        intro hnp,
            apply false.elim,
            apply h,
            intro hp,
            apply false.elim,
            exact hnp hp,
}

example : (p → q) → (¬p ∨ q) := by
{
    intro h,
    apply or.elim (em p),

    intro hp,
    exact or.inr (h hp),

    intro hnp,
    exact or.inl hnp 
}

example : (¬q → ¬p) → (p → q) := by
{
    intro h,
    intro hp,
    apply or.elim (em q),
    intro hq, exact hq,
    intro hnq,
    apply false.elim,
    exact (h hnq) hp 
}

example : p ∨ ¬p := by { exact em p }

example : (((p → q) → p) → p) := by
{
   intro h,
   apply or.elim (em p),
   intro hp, exact hp,
   intro hnp,
   apply h,
   intro hp,
   apply false.elim,
   exact hnp hp,
}
-- section 4
variables (a : Type) (ap aq : a → Prop) (ea : a)

example : (∀ x, ap x ∧ aq x) ↔ (∀ x, ap x) ∧ (∀ x, aq x) := by
{
    apply iff.intro,
    {
        intro h,
        apply and.intro,
            intro h1, exact (h h1).left,
            intro h1, exact (h h1).right
    },
    {
        intro h,
        intro h1,
        exact  ⟨h.left h1, h.right h1⟩,
    }
}

example : (∀ x, ap x → aq x) → (∀ x, ap x) → (∀ x, aq x) := by
{
    intro h,
    intro h2,
    intro h3,
    exact h h3 (h2 h3),
}

example : (∀ x, ap x) ∨ (∀ x, aq x) → ∀ x, ap x ∨ aq x := by 
{
    intros h h1,
    cases h with hallap hallaq,
    exact or.inl (hallap h1),
    exact or.inr (hallaq h1)
}

example : a → ((∀ x : a, r) ↔ r) := by
{
    intro h,
    apply iff.intro,
    intro h1,
    exact h1 h,
    intros h1 h2,
    exact h1
}

example : (∀ x, ap x ∨ r) → (∀ x, ap x) ∨ r := by
{
    intro h,
    apply or.elim (em r),
    intro hr,
    exact or.inr hr,
    intro hnr,
    left,
    intro h1,
    apply or.elim (h h1),
    intro hap,
    assumption,
    intro hr,
    apply false.elim,
    exact hnr hr,
}

example : (∀ x, r → ap x) ↔ (r → ∀ x, ap x) := by
{
    apply iff.intro,
    {
        intros h hr h1,
        exact h h1 hr
    },
    {
       intro h,
       intro ha,
       intro hr,
       exact h hr ha 
    }
}

variables (men : Type) (barber : men) 
variable (shaves : men → men → Prop)

example : (∀ x : men, shaves barber x ↔ ¬shaves x x) → false := by
{
    intro given,
    let lem := assume h1: shaves barber barber, by
    {
        exact (given barber).mp h1 h1,
    },
    exact lem ((given barber).mpr lem ),
}
namespace hidden

def divides (m n : ℕ) : Prop := ∃ k, m * k = n

instance : has_dvd nat := ⟨divides⟩

def even (n : ℕ) : Prop := 2 ∣ n
def odd (n: ℕ) : Prop := 2 ∣ (n +1)

section
 variables m n : ℕ
 
 #check m ∣ n
 #check m^n
 #check even (m^n + 3)
end

def prime (n : ℕ) : Prop := ∀ x, (x ∣ n) → (x = 1 ∨ x = n)

def infintely_many_primes : Prop := ∀ n, ∃ x, prime x ∧ (x > n)

def Fermat_prime (n: ℕ) : Prop := (prime n) ∧ ∃ (x : ℕ), (2^2^x + 1) = n

def infinitely_many_Fermat_primes : Prop := ∀ n, ∃ x, Fermat_prime(x) ∧ (x > n) 

def golbach_conjecture : Prop := ∀ n, (n > 2 ∧ even n) → ∃ (x y : ℕ), (prime x ∧ prime y) ∧ (x + y = n)

def Goldbach's_weak_conjecture : Prop :=  ∀ n, (n > 5 ∧  odd n) → ∃ (x y z : ℕ), (prime x ∧ prime y ∧ prime z) ∧ (x + y + z = n)

def Fermat's_last_theorem : Prop := ∀ (a b c n : ℕ), (n > 2) ∧ ¬(a^b + b^n = c^n)
end hidden

-- Section 4 existential proofs

example : (∃ x : a, r) → r := by
{
    intro h,
    cases h with x px,
    assumption
}

include ea
example : r → (∃ x : a, r) := by
{
    intro h,
    constructor,
    assumption,
    assumption
}
omit ea

example : (∃ x, ap x ∧ r) ↔ (∃ x, ap x) ∧ r := by
{
    apply iff.intro,
    {
        intro h,
        constructor,
        cases h with x pxr,
        constructor,
        exact pxr.left,
        cases h with x pxr,
        exact pxr.right
    },
    {
        intro h,
        cases h.left with x px,
        constructor,
        constructor,
        assumption,
        apply h.right,
    }
} 

example : (∃ x, ap x ∨ aq x) ↔ (∃ x, ap x) ∨ (∃ x, aq x) := by
{
    apply iff.intro,
    {
        intro h,
        cases h with x porq,
        cases porq,
        left,
        constructor,
        assumption,
        right,
        constructor,
        assumption,
    },
    {
        intro h,
        cases h with hl hr,
        cases hl with x hap,
        constructor,
        left,
        assumption,
        cases hr with x haq,
        constructor,
        right,
        assumption,
    }
} 

example : (∀ x, ap x) ↔ ¬ (∃ x, ¬ ap x) := by
{
    apply iff.intro,
    {
        intros h fe,
        cases fe with x apx,
        exact apx (h x)
    },
    {
        intros h hx,
        -- excluded middle here
        cases em (ap hx) with h1 h2,
        assumption,
        apply false.elim,
        apply h,
        constructor,
        assumption,         
    }
}

-- review here
example : (∃ x, ap x) ↔ ¬(∀ x, ¬ ap x) := by
{
    apply iff.intro,
    {
        intros h hx,
        cases h with x px,
        exact hx x px 
    },
    {
        intro h,
        -- excluded middle here
        cases em (∃ x, ap x) with h1 h2,
        exact h1,
        apply false.elim,
        apply h,
        intros h3 h4,
        exact h2 ⟨h3, h4⟩
    }
}
example : (¬ ∃ x, ap x)  ↔ (∀ x, ¬ ap x) := by
{
    apply iff.intro,
    {
        intros h hx hapx,
        apply h,
        constructor,
        exact hapx, 
    },
    {
        intros ha he,
        cases he with x px,
        exact ha x px,
    },
}

example : (¬ ∀ x, ap x) ↔ (∃ x, ¬ ap x) := by
{
    apply iff.intro,
    {
        intros h,
        cases em (∃ x, ¬ ap x) with h1 h2,
        assumption,
        apply false.elim,
        apply h,
        intro h3,
        cases em (ap h3) with h4 h5,
        assumption,
        apply false.elim,
        apply h2,
        exact ⟨h3, h5⟩ 
    },
    {
        intros h1 h2,
        cases h1 with x apx,
        exact apx (h2 x)
    }
}

example : (∀ x, ap x → r) ↔ (∃ x, ap x) → r := by
{
    apply iff.intro,
    {
        intros h1 h2,
        cases h2 with x hapx,
        exact h1 x hapx
    },
    {
        intros h1 h2 h3,
        exact h1 ⟨h2, h3⟩
    }    
}
include ea
example : (∃ x, ap x → r) ↔ (∀ x, ap x) → r := by
{
    apply iff.intro,
    {
        intros h1 h2,
        cases h1 with h3 h4,
        exact h4 (h2 h3),
    },
    {
        intros h1,
        -- cases em (∃ x, ap x → r) with h4 h5,
        --     assumption,
        cases em (∀ x, ap x) with h2 h3,
        constructor,
            intro h4,
            exact h1 h2,
            exact ea,
        cases em (∃ x, ap x → r) with h4 h5,
            assumption,

            apply false.elim,
            apply h3,
            intro h6,
        cases (em (ap h6)) with h7 h8,
            assumption,
            apply false.elim,
            apply h5,
            constructor,
            intro h9,
            apply false.elim,
            exact h8 h9,
    }
}

example : (∃ x, r → ap x) ↔ (r → ∃ x, ap x) := by
{
    apply iff.intro,
    {
        intros h1 h2,
        cases h1 with x apx,
        exact ⟨x, apx h2⟩ 
    },
    {
        intros h1, 
        cases em (∃ x, r → ap x) with h1 h2,
        assumption,
        apply exists.intro,
        intro hr,
        apply false.elim,
        apply h2,
        cases (h1 hr) with x apx,
        exact ⟨x, λ gr : r, apx⟩,
        exact ea,
    }
}
omit ea

-- last one
example (p q r : Prop) (hp : p) :
(p ∨ q ∨ r) ∧ (q ∨ p ∨ r) ∧ (q ∨ r ∨ p) :=
by  { split, left, assumption, split, right, left, assumption, right, right, assumption }