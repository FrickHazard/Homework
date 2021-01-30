import tactic

-- Let `Ω` be a "big underlying set" and let `X` and `Y` and `Z` be subsets

variables (Ω : Type) (X Y Z : set Ω) (a b c x y z : Ω)

namespace xena

/-!

# subsets

Let's think about `X ⊆ Y`. Typeset `⊆` with `\sub` or `\ss`
-/

-- `X ⊆ Y` is the same as `∀ a, a ∈ X → a ∈ Y` , by definition.

lemma subset_def : X ⊆ Y ↔ ∀ a, a ∈ X → a ∈ Y :=
begin
  -- true by definition
  refl
end

lemma subset_refl : X ⊆ X :=
begin
  refl,
end

lemma subset_trans (hXY : X ⊆ Y) (hYZ : Y ⊆ Z) : X ⊆ Z :=
begin
  -- If you start with `rw subset_def at *` then you
  -- will have things like `hYZ : ∀ (a : Ω), a ∈ Y → a ∈ Z`
  -- You need to think of `hYZ` as a function, which has two
  -- inputs: first a term `a` of type `Ω`, and second a proof `haY` that `a ∈ Y`.
  -- It then produces one output `haZ`, a proof that `a ∈ Z`.
  -- You can also think of it as an implication:
  -- "if a is in Ω, and if a ∈ Y, then a ∈ Z". Because it's an implication,
  -- you can `apply hYZ`. This is a really useful skill!
  rw subset_def at *,
  intros a ainX,
  exact hYZ a (hXY a ainX)
end

/-!

# Equality of sets

Two sets are equal if and only if they have the same elements.
The name of this theorem is `set.ext_iff`.
-/

example : X = Y ↔ (∀ a, a ∈ X ↔ a ∈ Y) :=
begin
  exact set.ext_iff
end

-- In practice, you often have a goal `⊢ X = Y` and you want to reduce
-- it to `a ∈ X ↔ a ∈ Y` for an arbitary `a : Ω`. This can be done with
-- the `ext` tactic.


lemma subset.antisymm (hXY : X ⊆ Y) (hYX : Y ⊆ X) : X = Y :=
begin
  -- start with `ext a`,
  ext a,
  split,
  intros ainX,
  exact hXY ainX,
  intros ainY,
  exact hYX ainY,
end

/-!

### Unions and intersections

Type `\cup` or `\un` for `∪`, and `\cap` or `\i` for `∩`

-/

lemma union_def : a ∈ X ∪ Y ↔ a ∈ X ∨ a ∈ Y :=
begin
  -- true by definition
  refl,
end

lemma inter_def : a ∈ X ∩ Y ↔ a ∈ X ∧ a ∈ Y :=
begin
  -- true by definition
  refl,
end


-- You can rewrite with those lemmas above if you're not comfortable with
-- assuming they're true by definition.

-- union lemmas

lemma union_self : X ∪ X = X :=
begin
  ext,
  split,
  intros xux,
  cases xux, assumption, assumption,
  intro xX,
  apply (union_def Ω X X x).mpr,
  left, exact xX,
end

lemma subset_union_left : X ⊆ X ∪ Y :=
begin
  rw subset_def at *,
  intros a ainX,
  apply (union_def Ω X Y a).mpr,
  left, exact ainX,
end

lemma subset_union_right : Y ⊆ X ∪ Y :=
begin
  rw subset_def at *,
  intros a ainX,
  apply (union_def Ω X Y a).mpr,
  right, exact ainX
end

lemma union_subset_iff : X ∪ Y ⊆ Z ↔ X ⊆ Z ∧ Y ⊆ Z :=
begin
  split,
  intro xySubZ,
  constructor,
  exact (subset_trans Ω X (X ∪ Y) Z (subset_union_left Ω X Y) xySubZ),
  exact (subset_trans Ω Y (X ∪ Y) Z (subset_union_right Ω X Y) xySubZ),
  rintros ⟨xSubZ, ySubY⟩,
  rw subset_def at *,
  intros a ainXuY,
  cases ainXuY,
  exact xSubZ a ainXuY,
  exact ySubY a ainXuY,
end

variable (W : set Ω)

lemma union_subset_union (hWX : W ⊆ X) (hYZ : Y ⊆ Z) : W ∪ Y ⊆ X ∪ Z :=
begin
  rw subset_def at *,
  intros a ainWuY,
  cases ainWuY,
  apply (union_def Ω X Z a).mpr,
  left, exact hWX a ainWuY,
  right, exact hYZ a ainWuY,
end

lemma union_subset_union_left (hXY : X ⊆ Y) : X ∪ Z ⊆ Y ∪ Z :=
begin
  rw subset_def at *,
  intros a ainXZ,
  cases ainXZ,
  apply (union_def Ω Y Z a).mpr,
  left, exact hXY a ainXZ,
  apply (union_def Ω Y Z a).mpr,
  right,
  assumption
end

-- etc etc

-- intersection lemmas

lemma inter_subset_left : X ∩ Y ⊆ X :=
begin
  rw subset_def at *,
  intros a ainXnY,
  exact ((inter_def Ω X Y a).mp ainXnY).1,
end

-- don't forget `ext` to make progress with equalities of sets

lemma inter_self : X ∩ X = X :=
begin
  ext,
  split,
  intros xinXnX,
  exact ((inter_def Ω X X x).mp xinXnX).1,
  intros xinX,
  apply (inter_def Ω X X x).mpr,
  exact ⟨ xinX, xinX⟩,
end

lemma inter_comm : X ∩ Y = Y ∩ X :=
begin
  ext,
  split,
  intros xinXnY,
  apply (inter_def Ω Y X x).mpr,
  exact ⟨((inter_def Ω X Y x).mp xinXnY).2, ((inter_def Ω X Y x).mp xinXnY).1⟩,
  intros xinYnX,
  apply (inter_def Ω X Y x).mpr,
  exact ⟨((inter_def Ω Y X x).mp xinYnX).2, ((inter_def Ω Y X x).mp xinYnX).1⟩,
end

lemma inter_assoc : X ∩ (Y ∩ Z) = (X ∩ Y) ∩ Z :=
begin
  ext,
  split,
  intros xinX_YZ,
  apply (inter_def Ω (X ∩ Y) Z x).mpr,
  rcases xinX_YZ with ⟨xinX, ⟨xinY, xinZ⟩⟩,
  constructor,
  apply (inter_def Ω X Y x).mpr,
  constructor,
  assumption,
  assumption,
  assumption,
  intros xinXYZ,
  rcases xinXYZ with ⟨⟨xinX, xinY⟩, zinZ⟩,
  apply (inter_def Ω X (Y ∩ Z) x).mpr,
  constructor,
  assumption,
  apply (inter_def Ω Y Z x).mpr,
  constructor,
  assumption,
  assumption,
end

/-!

### Forall and exists

-/

lemma not_exists_iff_forall_not : ¬ (∃ a, a ∈ X) ↔ ∀ b, ¬ (b ∈ X) :=
begin
  split,
  intros h a ainX,
  exfalso,
  apply h,
  use a,
  use ainX,
  intros all exis,
  rcases exis with ⟨a, ainX⟩,
  exact all a ainX,
end

example : ¬ (∀ a, a ∈ X) ↔ ∃ b, ¬ (b ∈ X) :=
begin
  split,
  intros nallainX,
  by_contra H,
  apply nallainX,
  intro a,
  by_cases ainX : a ∈ X,
  assumption,
  exfalso,
  apply H,
  use a,

  intros exis,
  intro allainX,
  rcases exis with ⟨a, aninX⟩,
  exact aninX (allainX a),
end

end xena

