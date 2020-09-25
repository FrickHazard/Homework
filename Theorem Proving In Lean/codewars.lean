import tactic
-- -- open nat

-- -- #check _root_.prime

-- -- /-- Fermat conjectured that 2^2^n+1 was always prime-/
-- -- theorem fermat_was_wrong : ¬ (∀ n : ℕ, nat.prime (2^2^n + 1)) :=
-- -- begin
-- -- intro h,

-- -- end

-- theorem new_mul_left_cancel (a b c : nat) (ha : a ≠ 0) : a * b = a * c → b = c := sorry
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
apply nzeroP,
intro hp,
let h1 := (h3 (succ d2 + 8 - 3 -3) (h3 (succ d2 + 8 - 3) (h3 (succ d2 + 8) (h8 (succ d2) hp)))),
rw [reduce_3] at h1,
exact h1,
induction hd with d2 hd2,


end