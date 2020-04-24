

universes t u v
namespace hidden
-- inductive list (α : Type u)
-- | nil {} : list
-- | cons : α → list → list

-- #check inhabited nat

-- def partialComposition {β : Type u} {γ : Type u} :
-- (β option) → (γ option)
inductive empty : Type
inductive unit : Type
| star: unit

-- IMPLICIT EXCERSISE 1
-- inductive bool : Type
-- | ff: bool
-- | tt: bool

-- def band (b1 b2 : hidden.bool) : hidden.bool :=
-- hidden.bool.cases_on b1 hidden.bool.ff b2

-- def bor (b1 b2 : hidden.bool) : hidden.bool :=
-- hidden.bool.cases_on b1 (hidden.bool.cases_on b2 hidden.bool.ff b2) b1

-- def bnot (b1 : hidden.bool) : hidden.bool :=
-- hidden.bool.cases_on b1 hidden.bool.tt hidden.bool.ff


inductive prod (α : Type u) (β : Type v)
| mk : α → β → prod

-- IMPLICIT EXCERSISE 2
inductive sum (α : Type u) (β : Type v)
| inl {} : α → sum
| inr {} : β → sum

def fst {α : Type u} {β : Type v} (p : hidden.prod α β) : α :=
hidden.prod.rec_on p (λ a b, a)

def snd {α : Type u} {β : Type v} (p : hidden.prod α β) : β :=
hidden.prod.rec_on p (λ a b, b)

def prod_example (p : hidden.prod bool ℕ) : ℕ :=
hidden.prod.rec_on p (λ b n, cond b (2 * n) (2 * n + 1))

#reduce prod_example ((hidden.prod.mk bool.tt) 3)
#reduce prod_example ((hidden.prod.mk bool.ff) 3)

def sum_example (s : sum ℕ ℕ) : ℕ :=
sum.cases_on s (λ n, 2 * n) (λ n, 2 * n + 1)

#reduce sum_example (sum.inl 3)
#reduce sum_example (sum.inr 3)

inductive option (α : Type u)
| none {} : option
| some    : α → option
-- IMPLICIT EXCERSISE 3



def partial {α : Type u} {β : Type v} := α → option β

#check  ((λ (x: ℕ ), option.some (x > 4)) : partial)


-- proof of partial function composition,
-- for p1(p2(a)), if p2(a) is undefined, p1(p2(a)) is undefined
theorem partial_comp {α : Type t} {β : Type u} {γ : Type v}
    (p1 : @partial α β) (p2: @partial β γ) (a : α): option γ :=
    option.cases_on (p1 a) option.none (λ hb, p2 hb)

inductive inhabited (α : Type u)
| mk : α → inhabited

theorem intance_implies_type_is_inhabited {β : Type} (b : β) : inhabited β :=
    inhabited.mk b

theorem bool_is_inhabited : (inhabited bool) :=
    (inhabited.mk ff)
theorem bool_is_inhabited_2 : (inhabited bool) :=
    (intance_implies_type_is_inhabited ff)

theorem nat_is_inhabited : (inhabited ℕ ) :=
    (inhabited.mk 0)
theorem nat_is_inhabited_2 : (inhabited ℕ ) :=
    (intance_implies_type_is_inhabited 0)

end hidden

theorem prod_2_inhabited_types_is_inhabited
{α : Type t} {β : Type u} (h1 : inhabited α) (h2 : inhabited β):
inhabited (inhabited α × inhabited β) := inhabited.mk (prod.mk h1 h2)

theorem function_of_inhabited_type_is_inhabited
(α : Type t) (β : Type u) (b: inhabited β) :
(inhabited (α → inhabited β)) :=
inhabited.mk (assume a, b)

namespace B

inductive nat : Type
| zero : nat
| succ : nat → nat

def add (m n : B.nat) : B.nat :=
B.nat.rec_on n m (λ n add_m_n, B.nat.succ add_m_n)

#reduce B.add (B.nat.succ B.nat.zero) (B.nat.succ (B.nat.succ B.nat.zero))

end B

#check @eq.refl.{u}   -- ∀ {α : Sort u} (a : α), a = a
#check @eq.symm.{u}   -- ∀ {α : Sort u} {a b : α}, a = b → b = a
#check @eq.trans.{u}



theorem new_add_zero (m : nat) : m + 0 = m := rfl
theorem new_add_succ (m n : nat) : m + nat.succ n = nat.succ (m + n) := rfl

theorem new_zero_add (n : ℕ) : nat.add 0 n = n :=
nat.rec_on n
    rfl
    (assume n : ℕ,
        assume ih : nat.add 0 n = n, show nat.add 0 (nat.succ n) = nat.succ n,
        from calc
            nat.add 0 (nat.succ n) = nat.succ (nat.add 0 n) : rfl
            ... = nat.succ n : by rw ih)



theorem new_add_assoc (m n k : ℕ) : m + n + k = m + (n + k) :=
nat.rec_on k
  (show m + n + 0 = m + (n + 0), from rfl)
  (assume k,
    assume ih : m + n + k = m + (n + k),
    show m + n + nat.succ k = m + (n + nat.succ k), from
      calc
        m + n + nat.succ k = nat.succ (m + n + k) : rfl
          ... = nat.succ (m + (n + k)) : by rw ih
          ... = m + nat.succ (n + k) : rfl
          ... = m + (n + nat.succ k) : rfl)


theorem new_succ_n_add_m (m n : nat) : nat.succ (m + n) = (nat.succ m + n) :=
nat.rec_on n
(show nat.succ (m + 0) = (nat.succ m + 0), from rfl)
(assume n,
    assume ih : nat.succ (m + n) = (nat.succ m + n),
    show nat.succ (m + nat.succ n) = (nat.succ m + nat.succ n),
    from calc 
        nat.succ (m + nat.succ n) = nat.succ (m + nat.succ n) : rfl
        ... = nat.succ (nat.succ( m + n)) : rfl
        ... = nat.succ (nat.succ m + n) : by rw ih 
        ... = (nat.succ m + nat.succ n) : rfl)


theorem new_add_comm (m n : nat) : m + n = n + m :=
nat.rec_on n
  (show m + 0 = 0 + m, by rw [nat.zero_add, nat.add_zero])
  (assume n,
    assume ih : m + n = n + m,
    calc
      m + nat.succ n = nat.succ (m + n) : rfl
        ... = nat.succ (n + m) : by rw ih
        ... = nat.succ n + m : by rw new_succ_n_add_m)

theorem new_r_add_assoc (m n k : ℕ) : m + n + k = m + (n + k) :=
nat.rec_on k rfl (λ k ih, by simp only [new_add_succ, ih])

theorem new_r_succ_add (m n : nat) : nat.succ m + n = nat.succ (m + n) :=
nat.rec_on n rfl (λ n ih, by simp only [new_add_succ, ih])

theorem new_r_add_comm (m n : nat) : m + n = n + m :=
nat.rec_on n
  (by simp only [zero_add, add_zero])
  (λ n ih, by simp only [new_add_succ, ih, new_succ_n_add_m])
-- 7.5

namespace C
section
inductive list (α : Type u)
| nil {} : list
| cons : α → list → list

variable {α : Type}

local notation h :: t  := list.cons h t

def append (s t : list α) : list α :=
list.rec t (λ x l u, x::u) s

local notation s ++ t := append s t

theorem nil_append (t : list α) : list.nil ++ t = t := rfl
theorem cons_append (x : α) (s t : list α) :
  x::s ++ t = x::(s ++ t) := rfl

local notation `[` l:(foldr `,` (h t, list.cons h t) list.nil) `]` := l

section
  open nat
  #check [1, 2, 3, 4, 5]
  #check ([1, 2, 3, 4, 5] : C.list int)
end

-- 7.5 exercise

theorem append_nil (t : list α) : t ++ list.nil = t :=
    list.rec_on t
    rfl
    (assume itm lst ih, 
        show itm::lst ++ list.nil = itm::lst,
        from calc
        itm::lst ++ list.nil = itm::(lst ++ list.nil) : by rw cons_append
        ... = itm::lst : by rw ih
    )

-- triple nested recursive
theorem append_assoc (r s t : list α) :
  r ++ s ++ t = r ++ (s ++ t) :=
  list.rec_on t
  (show r ++ s ++ list.nil = r ++ (s ++ list.nil), from calc
     r ++ s ++ list.nil = r ++ s : by rw append_nil
     ... = r ++ (s ++ list.nil) : by rw append_nil
  ) 
  (assume itm lst ih, show
    r ++ s ++ itm::lst = r ++ (s ++ itm::lst), from
    list.rec_on s
    (show r ++ list.nil ++ itm::lst = r ++ (list.nil ++ itm::lst), from calc
     r ++ list.nil ++ itm::lst = r ++ itm::lst : by rw append_nil
     ... = r ++ (list.nil ++ itm::lst ) : by rw nil_append)
        (assume itm2 lst2 ih2, show
        r ++ itm2::lst2 ++ itm::lst = r ++ (itm2::lst2 ++ itm::lst), from
        list.rec_on r
        (show list.nil ++ itm2::lst2 ++ itm::lst = list.nil ++ (itm2::lst2 ++ itm::lst), from
            calc list.nil ++ itm2::lst2 ++ itm::lst = itm2::lst2 ++ itm::lst : by rw nil_append
            ... = list.nil ++ (itm2::lst2 ++ itm::lst ) : by rw nil_append
        )
        (assume itm3 lst3 ih3, show
            itm3::lst3 ++ itm2::lst2 ++ itm::lst = itm3::lst3 ++ (itm2::lst2 ++ itm::lst),
        from calc
            itm3::lst3 ++ itm2::lst2 ++ itm::lst = (itm3::lst3) ++ (itm2::lst2) ++ (itm::lst) : rfl
           ... = itm3::(lst3 ++ (itm2::lst2)) ++ (itm::lst) : by rw cons_append
           ... = itm3::((lst3 ++ (itm2::lst2)) ++ (itm::lst)) : by rw cons_append
           ... = itm3::((lst3 ++ (itm2::lst2 ++ itm::lst))) : by rw ih3
           ... = itm3::(lst3 ++ (itm2::lst2 ++ itm::lst)) : by rw cons_append)))

def length_list :  list α → ℕ :=
(assume l, show nat, from
list.rec_on l 0 (assume itm lst ih, show nat, from nat.succ ih))

-- Implict length exercise
theorem nil_zero_length : length_list (@list.nil α) = 0 := rfl
theorem length_plus_one (r : list α) (itm: α) : length_list (itm::r) = (length_list r) + 1 := rfl

example (r s : list α) : (length_list r) + (length_list s) = length_list (r++s) :=
list.rec_on r 
(show (length_list list.nil) + (length_list s) = length_list (list.nil++s),
    from calc
    (length_list list.nil) + (length_list s) = 0 + (length_list s) : by rw (@nil_zero_length α)
    ...  = (length_list s) : by rw nat.zero_add
    ... = length_list (list.nil++s) : by rw nil_append)
(assume itm r ih,
    show (length_list (itm::r)) + (length_list s) = length_list (itm::r++s), from
    calc
    (length_list (itm::r)) + (length_list s) = (length_list r) + 1 + (length_list s) : by rw length_plus_one
   ... = (length_list r + length_list s) + 1 : by rw nat.add_right_comm
    ... = length_list (r ++ s) + 1 : by rw ih
    ... = length_list (itm::(r++s)) : by rw length_plus_one
    ... = length_list (itm::r++s) : by rw cons_append
)
end
end C

inductive binary_tree
| leaf : binary_tree
| node : binary_tree → binary_tree → binary_tree

inductive cbtree
| leaf : cbtree
| sup : (ℕ → cbtree) → cbtree

namespace cbtree
def succ (t : cbtree) : cbtree :=
sup (λ n, t)

def omega : cbtree :=
sup (λ n, nat.rec_on n leaf (λ n t, succ t))
end cbtree

variable p : ℕ → Prop

example (hz : p 0) (hs : ∀ n, p (nat.succ n)) : ∀ n, p n :=
begin
  intro n,
  cases n,
  { exact hz },  -- goal is p 0
  apply hs       -- goal is a : ℕ ⊢ p (succ a)
end

example (n : ℕ) (h : n ≠ 0) : nat.succ (nat.pred n) = n :=
begin
  cases n with m,
  -- first goal: h : 0 ≠ 0 ⊢ succ (pred 0) = 0
    { apply (absurd rfl h) },
  -- second goal: h : succ m ≠ 0 ⊢ succ (pred (succ a)) = succ a
  reflexivity
end

def f (n : ℕ) : ℕ :=
begin
  cases n, exact 3, exact 7
end

example : f 0 = 3 := rfl
example : f 5 = 7 := rfl

def tuple (α : Type u) (n : ℕ) :=
  { l : list α // list.length l = n }

variables {α : Type u} {n : ℕ}

def rand_f {n : ℕ} (t : tuple α n) : ℕ :=
begin
  cases n, exact 3, exact 7
end

def my_tuple : tuple ℕ 3 :=  ⟨[0, 1, 2], rfl⟩

example : rand_f my_tuple = 7 := rfl

inductive foo : Type
| bar1 : ℕ → ℕ → foo
| bar2 : ℕ → ℕ → ℕ → foo

def silly (x : foo) : ℕ :=
begin
  cases x with a b c d e,
  exact b,    -- a, b    are in the context
  exact e     -- c, d, e are in the context
end
-- include foo in tatics
open foo

def silly_2 (x : foo) : ℕ :=
begin
  cases x,
    case bar1 : a b
      { exact b },
    case bar2 : c d e
      { exact e }
end

def silly_3 (x : foo) : ℕ :=
begin
  cases x,
    case bar2 : c d e
      { exact e },
    case bar1 : a b
      { exact b }
end

example (hz : p 0) (hs : ∀ n, p (nat.succ n)) (m k : ℕ) :
  p (m + 3 * k) :=
begin
  cases (m + 3 * k),
  { exact hz },  -- goal is p 0
  apply hs       -- goal is a : ℕ ⊢ p (succ a)
end
-- Top and bottom are the same ↑ ↓ 
example (hz : p 0) (hs : ∀ n, p (nat.succ n)) (m k : ℕ) :
  p (m + 3 * k) :=
begin
  generalize : m + 3 * k = n,
  cases n,
  { exact hz },  -- goal is p 0
  apply hs       -- goal is a : ℕ ⊢ p (succ a)
end

-- If the expression you case on does not appear in the goal, the cases tactic uses have to put the type of the expression into the context
example (p : Prop) (m n : ℕ)
  (h₁ : m < n → p) (h₂ : m ≥ n → p) : p :=
begin
  cases lt_or_ge m n with hlt hge,
  { exact h₁ hlt },
  exact h₂ hge
end

example (m n : ℕ) : m - n = 0 ∨ m ≠ n :=
begin
  cases decidable.em (m = n) with heq hne,
  { rw heq,
    left, exact nat.sub_self n },
  right, exact hne
end

open nat

theorem zero_add_n (n : ℕ) : 0 + n = n :=
begin
  induction n,
  case zero : { refl },
  case succ : n ih { rw [add_succ, ih]}
end

theorem succ_add_n (m n : ℕ) : succ m + n = succ (m + n) :=
begin
  induction n,
  case zero : { refl },
  case succ : n ih { rw [add_succ, ih] }
end

theorem add_comm_n (m n : ℕ) : m + n = n + m :=
begin
  induction n,
  case zero : { rw zero_add, refl },
  case succ : n ih { rw [add_succ, ih, succ_add] }
end

example (m n k : ℕ) (h : succ (succ m) = succ (succ n)) :
  n + k = m + k :=
begin
  injection h with h',
  injection h' with h'',
  rw h''
end

example (m n k : ℕ) (h : succ (succ m) = succ (succ n)) :
  n + k = m + k :=
begin
  injections with h' h'',
  rw h''
end

example (m n k : ℕ) (h : succ (succ m) = succ (succ n)) :
  n + k = m + k :=
by injections; simp *

-- 7.10. Exercises
namespace hidden_1

def new_mul (n m : ℕ) : ℕ  := 
    nat.rec_on n 0 (assume n ih, show ℕ, from m + ih)

def new_pred (n) : ℕ := 
    nat.rec_on n 0 (assume n ih, show ℕ, from n)

#reduce new_pred 4

def new_sub (n m : ℕ) : ℕ :=
    nat.rec_on m n (assume m ih, show ℕ, from pred ih)

#reduce new_sub 4 9

def new_exp (n m : ℕ) : ℕ :=
    nat.rec_on m 1 (assume m ih, show ℕ, from new_mul n ih)

#reduce new_exp 4 4

theorem any_numb_to_zero_one (n : ℕ) : new_exp n 0 = 1 := rfl

-- start with by definition properties
theorem any_numb_times_zero_is_zero (n : ℕ) : new_mul 0 n = 0 := rfl
theorem any_numb_times_one_is_numb (n : ℕ) : new_mul 1 n = n := rfl
theorem succ_plus_other_numb (n : ℕ) (m : ℕ) : new_mul (succ n) m = m + (new_mul n m) := rfl

theorem any_numb_times_zero_is_zero_rev (n : ℕ) : new_mul n 0 = 0 :=
nat.rec_on n rfl
(assume n ih, show new_mul (succ n) 0 = 0, from calc
    new_mul (succ n) 0 =  0 + new_mul n 0 : by rw succ_plus_other_numb
    ... = new_mul n 0 : by rw nat.zero_add
    ... = 0 : by rw ih)

theorem any_numb_times_one_is_numb_rev (n: ℕ) : new_mul n 1 = n :=
    nat.rec_on n
    rfl
    (assume n ih, show new_mul (succ n) 1 = (succ n), from
        calc
        new_mul (succ n) 1 = 1 + new_mul n 1 : by rw succ_plus_other_numb
        ... = 1 + n : by rw ih
        ... = n + 1 : by rw nat.add_comm
        ... = succ (n + 0) : by rw nat.add_succ
        ... = succ n : by rw nat.add_zero)

theorem succ_plus_other_numb_rev (n : ℕ) (m : ℕ) : new_mul n (succ m) = n + (new_mul n m) :=
    nat.rec_on n rfl
    (assume n ih, show new_mul (succ n) (succ m) = (succ n) + (new_mul (succ n) m), from calc
        new_mul (succ n) (succ m) = (succ m) + (new_mul n (succ m)) : by rw succ_plus_other_numb
        ... = (succ m) + (n + new_mul n m) : by rw ih
        ... =  (n + new_mul n m) + (succ m) : by rw nat.add_comm
        ... = n + (succ m) + (new_mul n m) : by rw nat.add_right_comm
        ... = succ (n + m) + (new_mul n m) : by rw nat.add_succ
        ... = ((succ n) + m) + (new_mul n m) : by rw ←nat.succ_add
        ... = (succ n) + (m + (new_mul n m)) : by rw nat.add_assoc
         ... = (succ n) + (new_mul (succ n) m) : by rw succ_plus_other_numb)


theorem new_mul_comm (n m : ℕ) : new_mul n m = new_mul m n :=
    nat.rec_on n
    (show new_mul 0 m = new_mul m 0, from calc
        new_mul 0 m = 0 : by rw any_numb_times_zero_is_zero
        ... = new_mul m 0 : by rw any_numb_times_zero_is_zero_rev)
    (assume n ih, show new_mul (succ n) m = new_mul m (succ n), from calc
        new_mul (succ n) m = m + new_mul n m : by rw succ_plus_other_numb
        ... = m + new_mul m n : by rw ih
        ... = new_mul m (succ n) : by rw succ_plus_other_numb_rev)

theorem new_mul_distribute_l (n m l : ℕ) : new_mul (m + n) l = (new_mul m l) + (new_mul n l) :=
    nat.rec_on m
    (show new_mul (0 + n) l = (new_mul 0 l) + (new_mul n l), from calc
        new_mul (0 + n) l = new_mul n l : by rw nat.zero_add
        ... = 0 + new_mul n l : by rw nat.zero_add
        ... = (new_mul 0 l) + (new_mul n l) : by rw any_numb_times_zero_is_zero)
    (assume m ih, show new_mul ((succ m) + n) l = (new_mul (succ m) l) + (new_mul n l), from calc
        new_mul (succ m + n) l = new_mul (succ (m + n)) l : by rw nat.succ_add
        ... = l + new_mul (m + n) l : by rw succ_plus_other_numb
        ... = l + (new_mul m l + new_mul n l) : by rw ih
        ... = (l + new_mul m l) + new_mul n l : by rw nat.add_assoc
        ... = (new_mul (succ m) l + new_mul n l) : by rw succ_plus_other_numb)  
 
theorem new_mul_distribute_r (n m l : ℕ) : new_mul l (m + n) = (new_mul l m) + (new_mul l n) :=
begin
    rw [new_mul_comm, new_mul_distribute_l, new_mul_comm, new_mul_comm l n]
end

-- theorem pred_new_order (n : ℕ) (pred n) : n + n = 2 :=

theorem new_mul_assoc (n m l : ℕ) : new_mul (new_mul n m) l = new_mul n (new_mul m l) :=
    nat.rec_on n
    rfl
    (assume n ih, show new_mul (new_mul (succ n) m) l = new_mul (succ n) (new_mul m l), from calc
        new_mul (new_mul (succ n) m) l = new_mul (m + new_mul n m) l : by rw succ_plus_other_numb
        ... = (new_mul m l) + new_mul (new_mul n m) l : by rw new_mul_distribute_l
        ... = (new_mul m l) + new_mul n (new_mul m l) : by rw ih
        ... = new_mul (succ n) (new_mul m l) : by rw succ_plus_other_numb)
-- 
theorem pred_zero (n : ℕ) : pred 0 = 0 := rfl
theorem pred_succ (n: ℕ) : nat.pred (nat.succ n) = n := rfl

theorem succ_pred (n: ℕ) (h : n ≠ 0) : nat.succ (pred n) = n := 
begin
  cases n with m,
  -- first goal: h : 0 ≠ 0 ⊢ succ (pred 0) = 0
    { apply (absurd rfl h) },
  -- second goal: h : succ m ≠ 0 ⊢ succ (pred (succ a)) = succ a
  reflexivity
end

theorem pred_add (n m : ℕ) (h : n ≠ 0) : (pred n + m) = pred (n + m) :=
begin
    cases n with n_,
    { apply (absurd rfl h) },
    apply (show pred (succ n_) + m = pred (succ n_ + m), from calc
        pred (succ n_) + m = n_ + m : by rw pred_succ
        ... = pred (succ (n_ + m)) : by rw pred_succ
        ... = pred (succ n_ + m) : by rw nat.succ_add)
end

theorem sub_zero (n : ℕ) : new_sub n 0 = n := rfl
-- theorem sub_ (n m : ℕ) : new_sub n 1 = pred n := rfl
theorem sub_succ (n m: ℕ) : new_sub n (succ m) = pred (new_sub n m) := rfl

theorem succ_sub (n m: ℕ) : (new_sub n m) = pred (new_sub (succ n) m):= 
nat.rec_on m (show new_sub n 0 = pred (new_sub (succ n) 0), from rfl)
(assume m ih, show new_sub n (succ m) = pred (new_sub (succ n) (succ m)), from calc
    new_sub n (succ m ) = pred (new_sub n m) : by rw sub_succ
    ... = pred (pred (new_sub (succ n) m)) : by rw ih
    ... = pred (new_sub (succ n) (succ m)) : by rw sub_succ)

theorem sub_zero_trunc_is_zero (n : ℕ) : new_sub 0 n = 0 := 
nat.rec_on n (show new_sub 0 0 = 0, from rfl)
(assume n ih, show new_sub 0 (succ n) = 0, from calc
    new_sub 0 (succ n) =  pred (new_sub 0 n): by rw sub_succ
    ... = pred 0 : by rw ih)

theorem sub_self_n (n : ℕ) : new_sub n n = 0 := 
nat.rec_on n rfl (assume n ih, show new_sub (succ n) (succ n) = 0, from calc
    new_sub (succ n) (succ n) = pred(new_sub (succ n) n) : by rw sub_succ
    ... = new_sub n n : by rw ←succ_sub
    ... = 0 : by rw ih) 

example (m n : ℕ) : m - n = 0 ∨ m ≠ n :=
begin
  cases decidable.em (m = n) with heq hne,
  { rw heq,
    left, exact nat.sub_self n },
  right, exact hne
end

-- theorem sub_grtr_thn (n m: ℕ) (h : m > n) : new_sub n m = 0 :=
-- nat.rec_on m (show new_sub n 0 = 0, from )

-- theorem sub_zero_trunc_is_zero (n : ℕ) : new_sub 0 n = 0 := 
-- begin
-- cases n with n_,
-- reflexivity,
-- apply (show  new_sub 0 (succ n_) = 0, from calc 
-- new_sub 0 (succ n_) = new_sub 0 pred (succ(succ n_)
-- )
-- end

end hidden_1
