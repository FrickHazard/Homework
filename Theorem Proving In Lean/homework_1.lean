import tactic
/-  Math40001 : Introduction to university mathematics.

Problem Sheet 1, October 2020.

This is a Lean file. It can be read with the Lean theorem prover.

You can work on this file online at the following URL:

or you can install Lean and its maths library following the
instructions at
https://leanprover-community.github.io/get_started.html

There are advantages to installing Lean on your own computer
(for example it's faster), but it's more hassle than
just using it online. 

In the below, delete "sorry" and replace it with some
tactics which prove the result.

-/

/- Question 1. 

Let P and Q be Propositions (that is, true/false statements).
Prove that P ∧ Q → Q ∧ P. 

-/

lemma question_one (P Q : Prop) : P ∨ Q → Q ∨ P :=
begin
  intro h,
  cases h with hq hp,
  right,
  assumption,
  left,
  assumption
end
/-

For question 2, comment out one option (or just delete it)
and prove the other one.
-/

-- Part (a): is → symmetric? NO

lemma question_2a_false : ¬ (∀ P Q : Prop, (P → Q) → (Q → P)) :=
begin
  intro h,
  have anything_from_false :=  (h false true) (λ a: false, false.elim a),
  apply anything_from_false,
  exact true.intro,
end

-- Part (b) : is ↔ symmetric? YES

lemma question_2b_true (P Q : Prop) : (P ↔ Q) → (Q ↔ P) :=
begin
  intro h,
  constructor,
  apply h.mpr,
  apply h.mp
end

-- lemma question_2b_false : ¬ (∀ P Q : Prop, (P ↔ Q) → (Q ↔ P)) :=
-- begin
-- sorry
-- end

/- Question 3.

Say P, Q and R are propositions, and we know:
1) if Q is true then P is true
2) If Q is false then R is false.

Can we deduce that R implies P? Comment out one
option and prove the other. Hint: if you're stuck,
"apply classical.by_contradiction" sometimes helps.
classical.by_contradiction is the theorem that ¬ ¬ P → P.
-/

lemma question_3_true (P Q R : Prop) 
  (h1 : Q → P)
  (h2 : ¬ Q → ¬ R) : 
  R → P :=
 begin
 intro r,
 cases (classical.em Q) with q nq,
 exact h1 q,
 exact false.elim (h2 nq r)
end


/- Question 4.

Is it possible to find three true-false statements P , Q and R, such that
(P ∨ Q ∨ R) ∧ (¬P ∨ Q ∨ R) ∧ (¬P ∨ ¬Q ∨ R) ∧ (¬P ∨ ¬Q ∨ ¬R)
is true?

-/

lemma question_4_true : ∃ (P Q R : Prop),
  (P ∨ Q ∨ R) ∧ (¬P ∨ Q ∨ R) ∧ (¬P ∨ ¬Q ∨ R) ∧ (¬P ∨ ¬Q ∨ ¬R) :=
begin
  existsi false,
  existsi true,
  existsi false,
  constructor,
  right, left, exact true.intro,
  constructor,
  right, left, exact true.intro,
  constructor,
  left, exact (λa, a),
  left, exact (λ a, a),
  -- use false true false,
  -- cases (classical.em Q) with q nq,

end


--lemma question_4_false : ∀ (P Q R : Prop),
--  ¬ ((P ∨ Q ∨ R) ∧ (¬P ∨ Q ∨ R) ∧ (¬P ∨ ¬Q ∨ R) ∧ (¬P ∨ ¬Q ∨ ¬R)) :=
--begin
--  sorry
--end
open int
lemma reduce (a: ℤ) :  a + 16 - 3 -3 -3 -3 -3 = int.succ a  :=
begin
  ring
end

lemma reduce_2 :  8 - 3 - 3 - 3 = int.pred 0  :=
begin
  ring
end

lemma reduce_3 (a: ℤ) :  a + 8 - 3 - 3 - 3 = int.pred a  :=
begin
  ring
end

lemma reduce_4 (a: ℤ) :  int.pred (int.succ a) = a  :=
begin
  rw [pred_succ],
end

lemma test_1 : int.succ  -[1+ 0] = 0 :=
begin
  refl
end

lemma reduce_5 (a: ℤ) :  a + 8 + 8 - 3 -3 -3 -3 -3 = int.succ a  :=
begin
  rw int.add_assoc,
  ring,
end


/- Question 5.

  Say that for every integer n we have a proposition P n.
  Say we know P n → P (n + 8) for all n, and
  P n → P (n -3) for all n. Prove that the P n are either
  all true, or all false. 

This question is harder than the others.

-/

lemma question_5 (P : ℤ → Prop) (h8 : ∀ n, P n → P (n + 8)) (h3 : ∀ n, P n → P (n - 3)) :
(∀ n, P n) ∨ (∀ n, ¬ (P n)) :=
begin
  cases (classical.em (P 0)) with zeroP nzeroP,
  left,
  intro n,
  induction n with d hd,
  induction d with d2 hd2,
  apply zeroP,
  let h1 := h3 (int.of_nat d2 + 16 - 3 - 3 - 3 - 3) (h3 (int.of_nat d2 + 16 - 3 - 3 - 3) (h3 (int.of_nat d2 +   16 - 3 - 3) (h3 (int.of_nat d2 + 16 - 3) (h3 (int.of_nat d2 + 16) (h8 (int.of_nat d2 + 8) (h8 (int.of_nat d2) hd2)))))),
rw [reduce] at h1,
exact h1,
induction hd with d2 hd2,
let h1:= (h3 (8 - 3 - 3) (h3 (8 - 3) (h3 8 (h8 0 zeroP)))),
rw [reduce_2] at h1,
exact h1,
let h1:= (h3 (-[1+ d2] + 8 - 3 - 3) (h3 (-[1+ d2] + 8 - 3) (h3 (-[1+ d2] + 8) (h8 (-[1+ d2]) (hd2) )))),
rw [reduce_3] at h1,
exact h1,
right,
intro n,
induction n with d hd,
induction d with d2 hd2,
intro hp,
apply nzeroP,
apply hp,
intro hp,
let h1 := (h3 ((succ d2) + 8 - 3 - 3) (h3 ((succ d2) + 8 - 3) (h3 ((succ d2) + 8) (h8 (succ d2) hp)))),
rw [reduce_3, pred_succ] at h1,
exact hd2 h1,
induction hd with d2 hd2,
intro hp,
apply nzeroP,
let h1 := h3 (-[1+ 0] + 16 - 3 - 3 - 3 - 3) (h3 (-[1+ 0] + 16 - 3 - 3 - 3) (h3 (-[1+ 0] + 16 -3 - 3) (h3 (-[1+ 0] + 16 - 3) (h3 (-[1+ 0] + 16) (h8 (-[1+ 0] + 8) (h8 -[1+ 0] hp)))))),
rw [reduce, test_1] at h1,
exact h1,
intro hp,
apply hd2,

let h1 := h3 (-[1+ (d2.succ)] + 8 + 8 - 3 - 3 - 3 - 3) (h3 (-[1+ (d2.succ)] + 8 + 8 - 3 - 3 - 3) (h3 (-[1+ (d2.succ)] + 8 + 8 -3 - 3) (h3 (-[1+ (d2.succ)] + 8 + 8 - 3) (h3 (-[1+ (d2.succ)] + 8 + 8) (h8 (-[1+ (d2.succ)] + 8) (h8 -[1+ (d2.succ)] hp)))))),
rw [reduce_5] at h1,
exact h1,

--exact h1,
--induction hd with d2 hd2,


end

/-
The first four of these questions can be solved using only the following
tactics:

intro
apply (or, better, refine)
left, right, cases, split
assumption (or, better, exact)
have,
simp,
use,
contradiction (or, better, false.elim)

The fifth question is harder. 
-/
