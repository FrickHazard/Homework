import week_7.Part_A_quotients
import week_7.Part_B_universal_property

/-

# `Z ≃ ℤ`

Let's use the previous parts to show that Z and ℤ are isomorphic.

-/

-- Let's define p apply quotient.induction_on x,ℤ to be the usual subtraction function ℕ² → ℤ
def pℤ (ab : N2) : ℤ := (ab.1 : ℤ) - ab.2

@[simp] lemma pℤ_def (a b : ℕ) : pℤ (a, b) = (a : ℤ) - b := rfl

-- Start with `intro z, apply int.induction_on z` to prove this.
theorem pℤsurj : function.surjective pℤ :=
begin
  intro z,
  apply int.induction_on z,
  { use 0, refl },
  {
    intros i existsPZ,
    cases existsPZ with n2 pn2,
    use (n2.1 +1, n2.2),
    rw ←pn2,
    rw pℤ,
    rw pℤ,
    dsimp,
    ring,
  }, {
   intros i existsPZ,
   cases existsPZ with n2 pn2,
   use (n2.1, n2.2 + 1),
   rw ←pn2,
   rw pℤ,
   rw pℤ,
   dsimp,
   ring,
  },
end

-- The fibres of pℤ are equivalence classes.
theorem pℤequiv (ab cd : N2) : ab ≈ cd ↔ pℤ ab = pℤ cd :=
begin
  cases ab with a b,
  cases cd with c d,
  split;
  { simp,
    intros,
    linarith, }
end

-- It's helpful to have a random one-sided inverse coming from surjectivity
noncomputable def invp : ℤ → N2 :=
λ z, classical.some (pℤsurj z)

-- Here's the proof that it is an inverse.
@[simp] theorem invp_inv (z : ℤ) : pℤ (invp z) = z :=
classical.some_spec (pℤsurj z)
#check pℤ
-- Now we can prove that ℤ and pℤ are universal.
theorem int_is_universal : is_universal ℤ pℤ :=
begin
  constructor,
  { simp [pℤequiv] },
  intros T f h,
  use f ∘ invp,
  constructor,
  {
    rw function.comp.assoc,
    unfold function.comp,
    ext x,
    apply h,
    apply (pℤequiv x (invp (pℤ x))).mpr,
    rw invp_inv (pℤ x),
  },
  {
    intros k h,
    rw h,
    ext x,
    unfold function.comp,
    rw invp_inv,
  },
end

-- and now we can prove they're in bijection
noncomputable example : ℤ ≃ Z :=
universal_equiv_quotient _ _ _ int_is_universal
