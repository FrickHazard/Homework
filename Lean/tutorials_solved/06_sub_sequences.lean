import tuto_lib
/-
This file continues the elementary study of limits of sequences.
It can be skipped if the previous file was too easy, it won't introduce
any new tactic or trick.

Remember useful lemmas:

abs_le (x y : ℝ) : |x| ≤ y ↔ -y ≤ x ∧ x ≤ y

abs_add (x y : ℝ) : |x + y| ≤ |x| + |y|

abs_sub (x y : ℝ) : |x - y| = |y - x|

ge_max_iff (p q r) : r ≥ max p q  ↔ r ≥ p ∧ r ≥ q

le_max_left p q : p ≤ max p q

le_max_right p q : q ≤ max p q

and the definition:

def seq_limit (u : ℕ → ℝ) (l : ℝ) : Prop :=
∀ ε > 0, ∃ N, ∀ n ≥ N, |u n - l| ≤ ε

You can also use a property proved in the previous file:

unique_limit : seq_limit u l → seq_limit u l' → l = l'

def extraction (φ : ℕ → ℕ) := ∀ n m, n < m → φ n < φ m
-/


variable { φ : ℕ → ℕ}

/-
The next lemma is proved by an easy induction, but we haven't seen induction
in this tutorial. If you did the natural number game then you can delete
the proof below and try to reconstruct it.
-/
/-- An extraction is greater than id -/
lemma id_le_extraction' : extraction φ → ∀ n, n ≤ φ n :=
begin
  intros hyp n,
  induction n with n hn,
  { exact nat.zero_le _ },
  { exact nat.succ_le_of_lt (by linarith [hyp n (n+1) (by linarith)]) },
end

/-- Extractions take arbitrarily large values for arbitrarily large
inputs. -/
-- 0039
lemma extraction_ge : extraction φ → ∀ N N', ∃ n ≥ N', φ n ≥ N :=
begin
  intros h hN hN',
  apply exists.intro (max hN hN'),
  apply exists.intro (le_max_right hN hN'),
  calc
    hN ≤  max hN hN' : le_max_left _ _
    ... ≤ φ (max hN hN') : id_le_extraction h (max hN hN'),
end

/-- A real number `a` is a cluster point of a sequence `u`
if `u` has a subsequence converging to `a`.

def cluster_point (u : ℕ → ℝ) (a : ℝ) :=
∃ φ, extraction φ ∧ seq_limit (u ∘ φ) a
-/

variables {u : ℕ → ℝ} {a l : ℝ}

/-
In the exercise, we use `∃ n ≥ N, ...` which is the abbreviation of
`∃ n, n ≥ N ∧ ...`.
Lean can read this abbreviation, but displays it as the confusing:
`∃ (n : ℕ) (H : n ≥ N)`
One gets used to it. Alternatively, one can get rid of it using the lemma
  exists_prop {p q : Prop} : (∃ (h : p), q) ↔ p ∧ q
-/

/-
def cluster_point (u : ℕ → ℝ) (a : ℝ) :=
∃ φ, extraction φ ∧ seq_limit (u ∘ φ) a

def extraction (φ : ℕ → ℕ) := ∀ n m, n < m → φ n < φ m
-/

/-- If `a` is a cluster point of `u` then there are values of
`u` arbitrarily close to `a` for arbitrarily large input. -/
-- 0040
lemma near_cluster :
  cluster_point u a → ∀ ε > 0, ∀ N, ∃ n ≥ N, |u n - a| ≤ ε :=
begin
  intros hcp ε ε_pos N₀,
  cases hcp with φ hcq,
  cases hcq with hφ lim_a,
  cases (lim_a ε ε_pos) with N₁ hN₁,
  apply exists.intro                (φ  (max N₁ N₀)),
  apply exists.intro,
  linarith [(id_le_extraction hφ (max N₁ N₀)), (le_max_right N₁ N₀)],
  apply hN₁,
  exact le_max_left _ _,
end

/-
The above exercice can be done in five lines.
Hint: you can use the anonymous constructor syntax when proving
existential statements.
-/

/-- If `u` tends to `l` then its subsequences tend to `l`. -/
-- 0041
lemma subseq_tendsto_of_tendsto' (h : seq_limit u l) (hφ : extraction φ) :
seq_limit (u ∘ φ) l :=
begin
  intros ε ε_pos,
  cases (h ε ε_pos) with N₁ hN₁,
  apply exists.intro N₁,
  intros n hn,
  apply hN₁,
  linarith [id_le_extraction hφ n],
end

/-- If `u` tends to `l` all its cluster points are equal to `l`. -/
-- 0042
lemma cluster_limit (hl : seq_limit u l) (ha : cluster_point u a) : a = l :=
begin
  cases ha with φ φext_lim,
  exact unique_limit (φext_lim.2) (subseq_tendsto_of_tendsto hl φext_lim.1),
end

/-- Cauchy_sequence sequence -/
def cauchy_sequence (u : ℕ → ℝ) := ∀ ε > 0, ∃ N, ∀ p q, p ≥ N → q ≥ N → |u p - u q| ≤ ε

-- 0043
example : (∃ l, seq_limit u l) → cauchy_sequence u :=
begin
  rintros ⟨r, limr⟩ ε ε_pos,
  cases (limr (ε/2) (by linarith)) with N hN,
  use N,
  intros p q hpN hqN,
  have fact : - u q + r = r - u q, ring,
  -- hN p hpN
  calc
    |u p - u q| = |u p - u q + 0| : by ring
    ... = |u p - u q + (r - r )| : by rw ←sub_self
    ... = | u p - r + r - u q |: by ring
    ... = | u p - r + (- u q + r)|: by ring
    ... ≤ | u p - r| + | - u q + r| : (abs_add (u p - r) (- u q + r))
    ... = | u p - r| + |r - u q| : by rw fact
    ... = | u p - r| + |u q - r|  : by rw (abs_sub (u q) r)
    ... ≤ ε : by linarith [(hN p hpN), (hN q hqN)],
end


/-
In the next exercise, you can reuse
 near_cluster : cluster_point u a → ∀ ε > 0, ∀ N, ∃ n ≥ N, |u n - a| ≤ ε
-/
-- 0044
example (hu : cauchy_sequence u) (hl : cluster_point u l) : seq_limit u l :=
begin
  intros ε ε_pos,
  cases (hu (ε/2) (by linarith) ) with N hN,
  rcases (near_cluster hl (ε/2) (by linarith) N) with ⟨N₀ , ⟨N₀_pos, hN₀⟩⟩,
  use N₀,
  intros n hn,
  have c:= hN N₀ n N₀_pos (by linarith),
  calc
    |u n - l| =  |u n - l + 0| : by ring
    ... = |u n - l + (u N₀ - u N₀)| : by rw ←sub_self
    ... = |u n - u N₀ + (u N₀ - l)| : by ring
    ... ≤ |u n - u N₀| + |u N₀ - l| : (abs_add _ _)
    ... = |u N₀ - u n| + |u N₀ - l| : by rw (abs_sub _ _)
    ... ≤ ε : by linarith,
end
