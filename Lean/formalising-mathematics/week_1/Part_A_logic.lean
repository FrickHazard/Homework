-- We import all of Lean's standard tactics
import tactic

/-!
# Logic

We will develop the basic theory of following five basic logical symbols

* `→` ("implies" -- type with `\l`)
* `¬` ("not" -- type with `\not` or `\n`)
* `∧` ("and" -- type with `\and` or `\an`)
* `↔` ("iff" -- type with `\iff` or `\lr`)
* `∨` ("or" -- type with `\or` or `\v`

# Tactics you will need to know

* `intro`
* `exact`
* `apply`
* `rw`
* `cases`
* `split`
* `left`
* `right`

See `README.md` in `src/week_1` for an explanation of what these
tactics do.

Note that there are plenty of other tactics, and indeed once you've
"got the hang of it" you might want to try tactics such as `cc`,
`tauto` and its variant `tauto!`, `finish`, and `library_search`.

# What to do

The `example`s are to demonstrate things to you. They sometimes
use tactics you don't know. You can look at them but you don't
need to touch them.

The `theorem`s and `lemma`s are things which have no proof. You need to change
the `sorry`s into proofs which Lean will accept.

This paragraph is a comment, by the way. One-line comments
are preceded with `--`.
-/

-- We work in a "namespace". All this means is that whenever it
-- looks like we've defined a new theorem called `id`, its full
-- name is `xena.id`. Which is good because `id` is already
-- defined in Lean.
namespace xena

-- Throughout this namespace, P Q and R will be arbitrary (variable)
-- true-false statements.
variables (P Q R : Prop)

/-!
## implies (→)

To prove the theorems in this section, you will need to know about
the tactics `intro`, `apply` and `exact`. You might also like
the `assumption` tactic.
-/

/-- Every proposition implies itself. -/
theorem id : P → P :=
begin
  intro hP,
  -- Prove this using `intro` and `exact`
  exact hP
end

/-
Note that → isn't associative!
Try working out `false → (false → false) and (false → false) → false
-/

example : (false → (false → false)) ↔ true := by simp
example : ((false → false) → false) ↔ false := by simp

-- in Lean, `P → Q → R` is _defined_ to mean `P → (Q → R)`
-- Here's a proof of what I just said.
example : (P → Q → R) ↔ (P → (Q → R)) :=
begin
  -- look at the goal!
  refl -- true because ↔ is reflexive
end

theorem imp_intro : P → Q → P :=
begin
  -- remember that by definition the goal is P → (Q → P).
  -- Prove this proposition using `intro` and `exact`.
  -- Experiment. Can you prove it using `intros` and `assumption`?
  intros hp hq,
  exact hp,
end

/-- If we know `P`, and we also know `P → Q`, we can deduce `Q`. -/
lemma modus_ponens : P → (P → Q) → Q :=
begin
  -- You might find the `apply` tactic useful here.
  intros hp hpq,
  exact hpq hp,
end

/-- implication is transitive -/
lemma imp_trans : (P → Q) → (Q → R) → (P → R) :=
begin
  -- The tactics you know should be enough
  intros hpq hqr hp,
  exact hqr (hpq hp),
end

-- This one is a "relative modus ponens" -- in the
-- presence of P, if Q -> R and Q then R.
lemma forall_imp : (P → Q → R) → (P → Q) → (P → R) :=
begin
  -- `intros hPQR hPQ hP,` would be a fast way to start.
  -- Make sure you understand what is going on there, if you use it.
  intros hqr hpq hp,
  exact hqr hp (hpq hp)
end

/-

### not

`not P`, with notation `¬ P`, is *defined* to mean `P → false` in Lean,
i.e., the proposition that P implies false. You can easily check with
a truth table that P → false and ¬ P are equivalent.

We develop a basic interface for `¬`.
-/


-- I'll prove this one for you
theorem not_iff_imp_false : ¬ P ↔ (P → false) :=
begin
  -- true by definition
  refl
end

theorem not_not_intro : P → ¬ (¬ P) :=
begin
  intro hP,
  rw not_iff_imp_false,
  intros np,
  exact np hP,
  -- You can use `rw not_iff_imp_false` to change `¬ X` into `X → false`.
  -- But you don't actually have to, because they are the same *by definition*
end

-- Here is a funny alternative proof! Can you work out how it works?
example : P → ¬ (¬ P) :=
begin
  apply modus_ponens,
end

-- Here is a proof which does not use tactics at all, but uses lambda calculus.
-- It is called a "term mode" proof. We will not be discussing term mode
-- much in this course. It is a cool way to do basic logic proofs, but
-- it does not scale well in practice.
example : P → ¬ (¬ P) :=
λ hP hnP, hnP hP

-- This is "modus tollens". Some mathematicians think of it as
-- "proof by contradiction".
theorem modus_tollens : (P → Q) → (¬ Q → ¬ P) :=
begin
  intros pq nq hp,
  exact nq (pq hp)
end

-- This one cannot be proved using constructive mathematics!
-- You _have_ to use a tactic like `by_contra` (or, if you're happy
-- to cheat, the full "truth table" tactic `tauto!`.
-- Try it without using these, and you'll get stuck!
theorem double_negation_elimination : ¬ (¬ P) → P :=
begin
  intro nnp,
  by_contradiction H,
  exact nnp H,
end

/-!

### and

The hypothesis `hPaQ : P ∧ Q` in Lean, is equivalent to
hypotheses `hP : P` and `hQ : Q`.

If you have `hPaQ` as a hypothesis, and you want to get to
`hP` and `hQ`, you can use the `cases` tactic.

If you have `⊢ P ∧ Q` as a goal, and want to turn the goal
into two goals `⊢ P` and `⊢ Q`, then use the `split` tactic.

Note that after `split` it's good etiquette to use braces
e.g.

example (hP : P) (hQ : Q) : P ∧ Q :=
begin
  split,
  { exact hP },
  { exact hQ }
end

but for this sort of stuff I think principled indentation
is OK

```
example (hP : P) (hQ : Q) : P ∧ Q :=
begin
  split,
    exact hP,
  exact hQ
end
```

-/

theorem and.elim_left : P ∧ Q → P :=
begin
  -- I would recommend starting with
  -- `intro hPaQ,` and then `cases hPaQ with hP hQ`.
  intros pandq,
  exact pandq.1,
end

theorem and.elim_right : P ∧ Q → Q :=
begin
  intros pandq,
  exact pandq.2,
end

-- fancy term mode proof
example : P ∧ Q → Q := λ hPaQ, hPaQ.2

theorem and.intro : P → Q → P ∧ Q :=
begin
  -- remember the `split` tactic.
  intros p q,
  exact ⟨p, q⟩
end

-- the "eliminator for and"
theorem and.elim : P ∧ Q → (P → Q → R) → R :=
begin
  intros pandq hpqr,
  exact hpqr pandq.1 pandq.2
end

-- a variant
theorem and.rec : (P → Q → R) → P ∧ Q → R :=
begin
  intros pqr pandq,
  exact pqr pandq.1 pandq.2
end

-- and is symmetric
theorem and.symm : P ∧ Q → Q ∧ P :=
begin
  intros pandq,
  exact ⟨pandq.2, pandq.1 ⟩
end

-- term mode proof
example : P ∧ Q → Q ∧ P :=
λ ⟨P, Q⟩, ⟨Q, P⟩

-- and is transitive
theorem and.trans : (P ∧ Q) → (Q ∧ R) → (P ∧ R) :=
begin
  -- The `rintro` tactic will do `intro` and `cases` all in one go.
  -- If you like, try starting this proof with `rintro ⟨hP, hQ⟩` if you want
  -- to experiment with it. Get the pointy brackets with `\<` and `\>`,
  -- or both at once with `\<>`.
  intros pandq qandr,
  exact ⟨pandq.1, qandr.2⟩
end

/-
Recall that the convention for the implies sign →
is that it is _right associative_, by which
I mean that `P → Q → R` means `P → (Q → R)` by definition.
Now note that if `P` implies `Q → R`
then this means that `P` and `Q` together, imply `R`,
so `P → Q → R` is logically equivalent to `(P ∧ Q) → R`.

We proved that `P → Q → R` implied `(P ∧ Q) → R`; this was `and.rec`.
Let's go the other way.
-/

lemma imp_imp_of_and_imp : ((P ∧ Q) → R) → (P → Q → R) :=
begin
  intros pandqr p q,
  exact pandqr ⟨p, q⟩,
end


/-!

### iff

The basic theory of `iff`.

In Lean, to prove `P ∧ Q` you have to prove `P` and `Q`.
Similarly, to prove `P ↔ Q` in Lean, you have to prove `P → Q`
and `Q → P`. Just like `∧`, you can uses `cases h` if you have
a hypothesis `h : P ↔ Q`, and `split` if you have a goal `⊢ P ↔ Q`.
-/

/-- `P ↔ P` is true for all propositions `P`, i.e. `↔` is reflexive. -/
theorem iff.refl : P ↔ P :=
begin
  -- start with `split`
  split,
  intros p,
  assumption,
  intros p,
  assumption,
end

-- If you get stuck, there is always the "truth table" tactic `tauto!`
example : P ↔ P :=
begin
  tauto!, -- the "truth table" tactic.
end

-- refl tactic also works
example : P ↔ P :=
begin
  refl -- `refl` knows that `=` and `↔` are reflexive.
end

/-- `↔` is symmetric -/
theorem iff.symm : (P ↔ Q) → (Q ↔ P) :=
begin
  intros hpq,
  split,
  exact hpq.mpr,
  exact hpq.mp,
end

-- NB there is quite a devious proof of this using `rw`.

-- show-off term mode proof
example : (P ↔ Q) → (Q ↔ P) :=
λ ⟨hPQ, hQP⟩, ⟨hQP, hPQ⟩

/-- `↔` is commutative -/
theorem iff.comm : (P ↔ Q) ↔ (Q ↔ P) :=
begin
  split,
  intros hpq,
  apply iff.symm,
  assumption,
  intros hqp,
  apply iff.symm,
  assumption
end

-- without rw or cc this is painful!
/-- `↔` is transitive -/
theorem iff.trans :  (P ↔ Q) → (Q ↔ R) → (P ↔ R) :=
begin
  intros hpq hqr,
  rw hqr at hpq,
  assumption
end

-- This can be done constructively, but it's hard. You'll need to know
-- about the `have` tactic to do it. Alternatively the truth table
-- tactic `tauto!` will do it.
theorem iff.boss : ¬ (P ↔ ¬ P) :=
begin
  intro np,
  apply np.mp,
  exact np.mpr (λ p, np.mp p p),
  exact np.mpr (λ p, np.mp p p)
end

-- Now we have iff we can go back to and.

/-!
### ↔ and ∧
-/

/-- `∧` is commutative -/
theorem and_comm : P ∧ Q ↔ Q ∧ P :=
begin
  sorry,
end

-- fancy term-mode proof
example : P ∧ Q ↔ Q ∧ P :=
⟨and.symm _ _, and.symm _ _⟩

-- Note that ∧ is "right associative" in Lean, which means
-- that `P ∧ Q ∧ R` is _defined to mean_ `P ∧ (Q ∧ R)`.
-- Associativity can hence be written like this:
/-- `∧` is associative -/
theorem and_assoc : ((P ∧ Q) ∧ R) ↔ (P ∧ Q ∧ R) :=
begin
  split,
  intros pqr,
  exact ⟨pqr.1.1, pqr.1.2, pqr.2⟩,
  intros pqr,
  exact ⟨⟨pqr.1, pqr.2.1⟩, pqr.2.2,  ⟩
end



/-!

## Or

`P ∨ Q` is true when at least one of `P` and `Q` are true.
Here is how to work with `∨` in Lean.

If you have a hypothesis `hPoQ : P ∨ Q` then you
can break into the two cases `hP : P` and `hQ : Q` using
`cases hPoQ with hP hQ`

If you have a _goal_ of the form `⊢ P ∨ Q` then you
need to decide whether you're going to prove `P` or `Q`.
If you want to prove `P` then use the `left` tactic,
and if you want to prove `Q` then use the `right` tactic.

-/

-- recall that P, Q, R are Propositions. We'll need S for this one.
variable (S : Prop)

-- You will need to use the `left `tactic for this one.
theorem or.intro_left : P → P ∨ Q :=
begin
  intro hp,
  left,
  exact hp,
end

theorem or.intro_right : Q → P ∨ Q :=
begin
  intro q,
  right,
  assumption
end

/-- the eliminator for `∨`. -/
theorem or.elim : P ∨ Q → (P → R) → (Q → R) → R :=
begin
  intros porq hpr hqr,
  cases porq with hP hQ,
  exact hpr hP,
  exact hqr hQ,
end

/-- `∨` is symmetric -/
theorem or.symm : P ∨ Q → Q ∨ P :=
begin
  intros porq,
  cases porq with hP hQ,
  right, assumption,
  left, assumption,
end

/-- `∨` is commutative -/
theorem or.comm : P ∨ Q ↔ Q ∨ P :=
begin
  split,
  apply or.symm,
  apply or.symm,
end

/-- `∨` is associative -/
theorem or.assoc : (P ∨ Q) ∨ R ↔ P ∨ Q ∨ R :=
begin
  split,
  intros hpqr,
  cases hpqr with hpq hr,
  cases hpq with hP hQ,
  left, assumption,
  right, left, assumption,
  right, right, assumption,
  intros pqr,
  cases pqr with hp hqr,
  left, left, assumption,
  cases hqr with hq hr,
  left, right, assumption,
  right, assumption
end

/-!
### More about → and ∨
-/

theorem or.imp : (P → R) → (Q → S) → P ∨ Q → R ∨ S :=
begin
  intros hp hq porq,
  cases porq with hP hQ,
  left, exact hp hP,
  right, exact hq hQ,
end

theorem or.imp_left : (P → Q) → P ∨ R → Q ∨ R :=
begin
  intros hpq hpr,
  cases hpr,
  left, exact  hpq hpr,
  right, exact hpr
end

theorem or.imp_right : (P → Q) → R ∨ P → R ∨ Q :=
begin
  intros pq rop,
  cases rop,
  left, exact rop,
  right, exact pq rop
end

theorem or.left_comm : P ∨ Q ∨ R ↔ Q ∨ P ∨ R :=
begin
  -- Try rewriting `or.comm` and `or.assoc` to do this one quickly.
  split,
  rw or.comm,
  rw or.assoc,
  rw or.comm R P,
  intro a, exact a,
  rw or.comm,
  rw or.assoc,
  rw or.comm Q R,
  intro a, exact a,
end

/-- the recursor for `∨` -/
theorem or.rec : (P → R) → (Q → R) → P ∨ Q → R :=
begin
  intros pr qr porq,
  cases porq,
  exact pr porq,
  exact qr porq,
end

theorem or.resolve_left : P ∨ Q → ¬P → Q :=
begin
  intros porq np,
  cases porq,
  exfalso,
  exact np porq,
  exact porq,
end

theorem or_congr : (P ↔ R) → (Q ↔ S) → (P ∨ Q ↔ R ∨ S) :=
begin
  intros hpr hqs,
  rw hqs,
  rw hpr,
end

/-!

### true and false

`true` is a true-false statement, which can be proved with the `trivial` tactic.

`false` is a true-false statment which can only be proved if you manage
to find a contradiction within your assumptions.

If you manage to end up with a hypothesis `h : false` then there's quite
a funny way to proceed, which we now explain.

If you have `h : P ∧ Q` then you can uses `cases h with hP hQ` to split
into two cases.

If you have `h : false` then what do you think happens if we do `cases h`?
Hint: how many cases are there?
-/


/-- eliminator for `false` -/
theorem false.elim : false → P :=
begin
  intros f,
  exfalso,
  exact f,
end

theorem and_true_iff : P ∧ true ↔ P :=
begin
  split,
  rintro ⟨p, _⟩,
  assumption,
  intros,
  constructor,
  assumption,
  trivial
  -- by_cases H: P,
  -- constructor,
  -- intro ptr,
  -- exact H,

end

theorem or_false_iff : P ∨ false ↔ P :=
begin
  split,
  intros porf,
  cases porf,
  assumption,
  exfalso,
  assumption,
  intro p,
  left, assumption,
end




end xena

