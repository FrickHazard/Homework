import topology.subset_properties

variables (X Y : Type) [topological_space X] [topological_space Y] (f : X → Y)

open filter set

open_locale filter -- for 𝓟
open_locale topological_space -- for 𝓝

/-

## Neighbourhood filters

If `α` is a topological space and `a : α` then `𝓝 a` is the following
filter on `α`: `X ∈ 𝓝 a` if and only if `X` contains an open neighbourhood
of `a`, or equivalently if `a` is in the interior of `X`. You should think
of `𝓝 a` as the "generalised subset" of `X` corresponding to an infinitesimally
small open neighbourhood of `a`.

Let's use the API for interior and closure, and check that `𝓝 a` is a filter.

Useful stuff from the topological space API:
`interior_univ : interior univ = univ`
`mem_univ x : x ∈ univ`
`interior_mono : s ⊆ t → interior s ⊆ interior t`
and guess what this is called:
`??? : interior (s ∩ t) = interior s ∩ interior t`
If you don't know how to #check your guess, ask me!
-/

variables {α : Type*} [topological_space α]

open set

-- neighbourhood filter 𝓝 a on α
example (a : α): filter α :=
{ sets := {X : set α | a ∈ interior X},
  univ_sets := begin
    have:= mem_univ a,
    rwa ←interior_univ at this,
  end,
  sets_of_superset := begin
    intros set1 set2 set1Prop set1_sub_set2,
    exact (interior_mono set1_sub_set2) set1Prop,
  end,
  inter_sets := begin
    intros set1 set2 set1Prop set2Prop,
    have: a ∈ interior set1 ∩ interior set2,
      exact ⟨set1Prop, set2Prop⟩,
    rwa ←interior_inter at this,
  end }

/-

## Cluster points.

A cluster point `a : α` of a filter `F : filter α` on a topological
space should be thought of as a point in the closure of the "generalised set"
corresponding to `F`. Here's the formal definition.

A cluster point of a filter `F : filter α` (also known as an accumulation
point or a limit point) is `x : α` such that `𝓝 x ⊓ F ≠ ⊥`. The picture
is that the intersection of the generalised set `F` and the infinitesimal
open neighbourhood `𝓝 x` of `x` is nonempty, or in other words that `x`
is in some kind of "closure" of `F`. Let's go through the notation more carefully
though, to try and figure out what it means. Recall that the order on filters is
upside-down, so `𝓝 x ⊓ F` means the filter generated by `F` and the
neighbourhoods of `x`, and `⊥` is the filter which contains every subset.
So this boils down to saying that there do not exist sets `A ∈ 𝓝 x` and `B ∈ F`
such that `A ∩ B = ∅`, or, in other words, every element of the filter
intersects every neighbourhood of `x`. To give an example, if `S` is any subset
of `α` then the cluster points of `𝓟 S` are just the points `x` such that any
open set containing `x` meets `S`, or equivalently that `x` is in the
closure of `S`.

The below lemma is called `cluster_pt.mono` in mathlib. The picture is
that if `F` and `G` are generalised subsets of a topological space
and `F ⊆ G`, then `closure F ⊆ closure G`. You can prove it by
using `cluster_pt.mono` of course, but why not give a direct proof
yourself? Start by rewriting `cluster_pt_iff`, which translates down
the definition of `cluster_pt` to a purely set-theoretic one not
involving `⊓`.

-/

example {x : α} {F G : filter α} (hxF : cluster_pt x F) (hFG : F ≤ G) :
  cluster_pt x G :=
begin
  rw cluster_pt_iff at *,
  intros U Uin𝓝x V VinG,
  exact hxF Uin𝓝x (hFG VinG),
end

/-

## Compactness

The actual definition of `is_compact` in mathlib: A subset `S` of a topological
space `α` is *compact* if for every filter `F ≠ ⊥` such that `S ∈ F`,
there exists `a : α` such that every set of `F` also meets every
neighborhood of `a`. In pictures -- `S` is compact iff the closure of every
non-empty generalised subset `F ⊆ S` contains an element of `S`. I'm not
too sure this picture helps much (at least, it doesn't help me too much).
Somehow noncompactness results in generalised subsets which are
"on the boundary of `S`" but which don't intersect a small neighbourhood of
any elements of `S`. Perhaps it's best not to worry about this exotic
definition right now -- or perhaps one of you can explain it to me. Of course
it's equivalent to the usual definition of compactness, but we won't prove this.

So here is another proof that a closed subset of a compact space is compact.
As before, we prove the more general assertion that if `α` is any topological
space then the intersection of a compact subset of `α` and a closed subset
of `α` is a compact subset of `α`.

Here's the actual definition in mathlib:

`def is_compact (s : set α) := ∀ ⦃f⦄ [ne_bot f], f ≤ 𝓟 s → ∃a∈s, cluster_pt a f`

Note that `ne_bot f` is in square brackets, which means that the type
class inference system is supposed to supply it. We will explicitly
add this fact into the type class inference system with `haveI` below.

Now here's a suggestion for a proof. Say `S` is compact and `C` is closed.
Say `F` is a non-bot filter with `F ≤ 𝓟 (S ∩ C)`.
First show that by compactness of `S`, we can find a cluster point
`a` for `F` in `S`. Now show that this cluster point is in `C` too,
because `C` is closed. You might find

`is_closed.closure_eq : is_closed C → closure C = C`

useful, and also

`mem_closure_iff_cluster_pt : a ∈ closure S ↔ cluster_pt a (𝓟 S)`

-/

#check inter_subset_left

lemma closed_of_compact (S : set X) (hS : is_compact S)
  (C : set X) (hC : is_closed C) : is_compact (S ∩ C) :=
begin
  -- assume `F` is a filter which is not `⊥`, and `≤` is the principal
  -- filter on `S ∩ C` (i.e. which contains `S ∩ C`). We need to find a
  -- cluster point for `F` which is in `S ∩ C`.
  intros F hnF hFSC,
  -- Let's tell the type class inference system about `hnf : f.ne_bot`
  haveI := hnF,
  -- see if you can take it from here.
  unfold is_compact at hS,

  have SinSiC : S ∈ 𝓟 (S ∩ C), {
   exact inter_subset_left _ _,
  },
  have f_le_𝓟S: F ≤ 𝓟 S, {
    intros set1,
    intros set1in𝓟,
    apply hFSC,
    exact mem_sets_of_superset SinSiC set1in𝓟,
  },
  have CinSiC : C ∈ 𝓟 (S ∩ C), {
   exact inter_subset_right _ _,
  },
  have f_le_𝓟C: F ≤ 𝓟 C, {
    intros set1,
    intros set1in𝓟,
    apply hFSC,
    exact mem_sets_of_superset CinSiC set1in𝓟,
  },
  rcases hS f_le_𝓟S with ⟨x, xinS, clst_pt⟩,
  use x,
  constructor,
  {
    constructor,
    { assumption },
    {
      have pc_clust : cluster_pt x (𝓟 C), {
        rw cluster_pt_iff,
        rw cluster_pt_iff at clst_pt,
        intros U₁ U₁in𝓝x V₁ V₁in𝓟C,
        have V₁inF: V₁ ∈ F, {
          exact f_le_𝓟C V₁in𝓟C,
        },
        exact clst_pt U₁in𝓝x V₁inF,
      },
      have := mem_closure_iff_cluster_pt.mpr pc_clust,
      rwa is_closed.closure_eq hC at this,
    }
  },
  {assumption},
end
