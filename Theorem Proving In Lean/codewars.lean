-- open nat

-- #check _root_.prime

-- /-- Fermat conjectured that 2^2^n+1 was always prime-/
-- theorem fermat_was_wrong : ¬ (∀ n : ℕ, nat.prime (2^2^n + 1)) :=
-- begin
-- intro h,

-- end

theorem new_mul_left_cancel (a b c : nat) (ha : a ≠ 0) : a * b = a * c → b = c := sorry
