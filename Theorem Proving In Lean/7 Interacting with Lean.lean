

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

variable {α : Type u}

local notation h :: t  := list.cons h t

def append (s t : list α) : list α :=
list.rec t (λ x l u, x::u) s

local notation s ++ t := append s t
local notation `[` l:(foldr `,` (h t, list.cons h t) list.nil) `]` := l

theorem nil_append (t : list α) : list.nil ++ t = t := rfl
theorem cons_append (x : α) (s t : list α) :
  x::s ++ t = x::(s ++ t) := rfl
theorem cons_to_append (t : list α) (itm : α): itm::t = [itm]++t := rfl 

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
theorem length_of_one_item (itm :α) : length_list [itm] = 1 := rfl


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

-- exercises 2

def reverse : list α → list α :=
(assume l, show list α, from 
    list.rec_on l list.nil
        (assume itm lst ih, show list α, from ih++(itm::list.nil)))

#reduce (reverse (reverse ([1, 2, 3, 4, 5])) : C.list int)


theorem reverse_list_add_item (t : list α) (itm : α) : reverse (itm::t) = (reverse t)++[itm] := rfl
theorem reverse_nil_list {z : Type u}: reverse (@list.nil z) = (@list.nil z) := rfl


theorem reverse_append (t u : list α) : (reverse (t++u)) = (reverse u) ++ (reverse t) :=
list.rec_on t
(show (reverse (list.nil++u) = reverse u ++ reverse list.nil), from calc 
    reverse (list.nil++u) = reverse u : by rw nil_append
    ... =  reverse u ++ list.nil : by rw append_nil
    ... =  reverse u ++ reverse list.nil : rfl)
(assume itm lst ih, show (reverse (itm::lst++u)) = (reverse u) ++ (reverse (itm::lst)), from calc
    (reverse (itm::lst++u)) = (reverse (itm::(lst++u))) : by rw cons_append
    ... = (reverse (lst++u))++[itm] : by rw reverse_list_add_item
    ... = ((reverse u) ++ (reverse lst))++[itm] : by rw ih
    ... = (reverse u) ++ ((reverse lst)++[itm]) : by rw append_assoc
    ... = (reverse u) ++ (reverse (itm::lst)) : by rw reverse_list_add_item)

theorem append_length (t u : list α) : length_list (t++u) = (length_list t) + (length_list u) :=
list.rec_on t
(show length_list (list.nil++u) = length_list list.nil + length_list u, from calc
    length_list (list.nil++u) = length_list u : rfl
    ... = length_list u + length_list list.nil : rfl
    ... =  length_list list.nil + length_list u : by rw nat.add_comm)
-- (show length_list (list.nil++u) = length_list list.nil + length_list u, from rfl)
(assume itm lst ih, show length_list ((itm::lst)++u) = length_list (itm::lst) + length_list u, from calc
    length_list ((itm::lst)++u) = length_list (itm::(lst++u)) : by rw cons_append
     ... = length_list (lst++u) + 1 : by rw length_plus_one
     ... = (length_list lst + length_list u) + 1 : by rw ih
     ... = (length_list u + length_list lst) + 1 : by rw nat.add_comm (length_list lst)
     ... = length_list u + (length_list lst + 1) : by rw nat.add_assoc
     ... = length_list u + length_list (itm::(lst)) : by rw ←(length_plus_one lst itm)
     ... = length_list (itm::(lst)) + length_list u  : by rw nat.add_comm)



theorem length_reverse_identity (t: list α) : length_list (reverse t) = length_list t :=
list.rec_on t 
rfl
(assume itm lst ih, show length_list (reverse (itm::lst)) = (length_list (itm::lst)), from calc
    length_list (reverse (itm::lst)) = length_list ((reverse lst)++[itm]): by rw reverse_list_add_item
    ... = length_list (reverse lst) + length_list [itm] : by rw append_length
    ... = length_list lst + length_list [itm] : by rw ih
    ... = length_list lst + 1 : by rw length_of_one_item
    ... = length_list (itm::lst): by rw length_plus_one)

example (t: list α) : reverse (reverse t) = t :=
list.rec_on t
(show reverse (reverse list.nil) = list.nil, from calc
reverse (reverse list.nil) = reverse list.nil : rfl
... = list.nil : rfl)
(assume itm lst ih, show reverse (reverse (itm::lst)) = (itm::lst), from calc
    reverse (reverse (itm::lst)) = reverse ((reverse lst) ++ [itm]) : by rw reverse_list_add_item
    ... =  ((reverse [itm]) ++ reverse (reverse lst)): by rw reverse_append
    ... = (reverse [itm]) ++ lst: by rw ih
    ... = (reverse (itm::list.nil)) ++ lst: by rw reverse_list_add_item
    ... = (reverse list.nil)++[itm] ++ lst: by rw reverse_list_add_item
    ... = (list.nil)++[itm] ++ lst: by rw (@reverse_nil_list α)
    ... = [itm]++lst : by rw nil_append
    ... = itm::lst : by rw ←cons_to_append)

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

#reduce nat.mul 4 5

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
theorem sub_succ (n m: ℕ) : new_sub n (succ m) = pred (new_sub n m) := rfl

theorem succ_sub (n m: ℕ) : (new_sub n m) = pred (new_sub (succ n) m):= 
nat.rec_on m (show new_sub n 0 = pred (new_sub (succ n) 0), from rfl)
(assume m ih, show new_sub n (succ m) = pred (new_sub (succ n) (succ m)), from calc
    new_sub n (succ m ) = pred (new_sub n m) : by rw sub_succ
    ... = pred (pred (new_sub (succ n) m)) : by rw ih
    ... = pred (new_sub (succ n) (succ m)) : by rw sub_succ)

theorem pred_sub_assoc (n m : ℕ) : pred (new_sub n m) = (new_sub (pred n) m) :=
nat.rec_on m
(show pred (new_sub n 0) = (new_sub (pred n) 0), from
    begin apply sub_zero, end)
(assume m ih, show pred (new_sub n (succ m)) = (new_sub (pred n) (succ m)), from
calc
pred (new_sub n (succ m)) = pred(pred(new_sub n  m)) : by rw sub_succ
... = pred(new_sub (pred n)  m) : by rw ih
... = (new_sub (pred n) (succ m)) : rfl)

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

example (m n : ℕ) : new_sub m n = 0 ∨ m ≠ n :=
begin
  cases decidable.em (m = n) with heq hne,
  { rw heq,
    left, exact sub_self_n n },
  right, exact hne
end


theorem sub_pseudo_assoc (n m l : ℕ) : new_sub (new_sub n m) l = new_sub (new_sub n l) m :=
nat.rec_on m
(show new_sub (new_sub n 0) l = new_sub( new_sub n l) 0, from calc
   new_sub (new_sub n 0) l = new_sub n l : by rw sub_zero)
(assume m ih, show new_sub (new_sub n  (succ m)) l = new_sub (new_sub n l) (succ m), from calc
    new_sub (new_sub n (succ m)) l = new_sub (pred (new_sub n m)) l : by rw sub_succ
    ... = pred (new_sub (new_sub n m) l) : by rw ←pred_sub_assoc
    ... = pred (new_sub (new_sub n l) m) : by rw ih
    ... = new_sub (new_sub n l) (succ m) : rfl)

-- theorem sub_grtr_thn (n m: ℕ) (h : m > n) : new_sub n m = 0 :=
-- nat.rec_on m (show new_sub n 0 = 0, from )

def nat_to_power (n m :ℕ) : ℕ := 
nat.rec_on m 1 (assume m ih, show ℕ, from new_mul ih n)

theorem nat_to_power_1 (n : ℕ) : (nat_to_power n 1) = n := rfl
theorem any_power_of_zero_is_one (n : ℕ) : (nat_to_power n 0) = 1 := rfl
theorem succ_power_mul (n m : ℕ) : (nat_to_power n (succ m)) = new_mul (nat_to_power n m) n := rfl

theorem group_power_in_mul (n m l : ℕ) : (new_mul (nat_to_power m l) (new_mul m n)) = (new_mul (nat_to_power m (succ l)) n) :=
nat.rec_on l
(show new_mul (nat_to_power m 0) (new_mul m n) = (new_mul (nat_to_power m (succ 0)) n), from calc
    new_mul (nat_to_power m 0) (new_mul m n) = new_mul 1 (new_mul m n) : by rw any_power_of_zero_is_one
    ... = (new_mul m n) :  by rw any_numb_times_one_is_numb
    ... = (new_mul (nat_to_power m 1) n) : by rw nat_to_power_1)
(assume l ih, show (new_mul (nat_to_power m (succ l)) (new_mul m n)) = (new_mul (nat_to_power m (succ(succ l))) n), from calc
    (new_mul (nat_to_power m (succ l)) (new_mul m n)) = (new_mul (new_mul (nat_to_power m l) m) (new_mul m n)) : by rw succ_power_mul
    ... = (new_mul (new_mul m (nat_to_power m l)) (new_mul m n)) : by rw new_mul_comm (nat_to_power m l) m
    ... = (new_mul m (new_mul (nat_to_power m l) (new_mul m n))) : by rw new_mul_assoc
    ... = (new_mul m (new_mul (nat_to_power m (succ l)) n)) : by rw ih
    ... = (new_mul (new_mul m (nat_to_power m (succ l))) n) : by rw ←new_mul_assoc
    ... = (new_mul (new_mul (nat_to_power m (succ l)) m) n) : by rw new_mul_comm m (nat_to_power m (succ l))
    ... = (new_mul (nat_to_power m (succ (succ l))) n)      : by rw ←(succ_power_mul m (succ l)))

theorem nat_to_power_1_rev (n : ℕ) : (nat_to_power 1 n) = 1 :=
nat.rec_on n
(show (nat_to_power 1 0) = 1, from  calc 
   (nat_to_power 1 0) = 1 : by rw any_power_of_zero_is_one)
(assume n ih, show nat_to_power 1 (succ n) = 1, from calc 
    nat_to_power 1 (succ n) = new_mul (nat_to_power 1 n) 1 : by rw succ_power_mul
    ... = (nat_to_power 1 n) : by rw any_numb_times_one_is_numb_rev
    ... = 1 : by rw ih)

theorem nat_power_mul_dist (n m l : ℕ) : (nat_to_power (new_mul n m) l) = (new_mul (nat_to_power n l) (nat_to_power m l)) :=
nat.rec_on l
(show nat_to_power (new_mul n m) 0 = (new_mul (nat_to_power n 0) (nat_to_power m 0)), from calc
    nat_to_power (new_mul n m) 0 = 1 : by rw any_power_of_zero_is_one
    ... = (nat_to_power n 0) : by rw ←any_power_of_zero_is_one
    ... = new_mul (nat_to_power n 0) 1 : by rw any_numb_times_one_is_numb_rev
    ... = (new_mul (nat_to_power n 0) (nat_to_power m 0)) : by rw ←any_power_of_zero_is_one)
(assume l ih, show (nat_to_power (new_mul n m) (succ l)) = (new_mul (nat_to_power n (succ l)) (nat_to_power m (succ l))), from calc
    (nat_to_power (new_mul n m) (succ l)) = new_mul (nat_to_power (new_mul n m)  l) (new_mul n m) : by rw succ_power_mul
    ... = new_mul (new_mul (nat_to_power n l) (nat_to_power m l)) (new_mul n m) : by rw ih
    ... = new_mul (nat_to_power n l) (new_mul (nat_to_power m l) (new_mul n m)) : by rw new_mul_assoc
    ... = new_mul (nat_to_power n l) (new_mul (nat_to_power m l) (new_mul m n)) : by rw new_mul_comm n
    ... = new_mul (nat_to_power n l) (new_mul (nat_to_power m (succ l)) n) : by rw group_power_in_mul
    ... = new_mul (nat_to_power n l) (new_mul n (nat_to_power m (succ l))) : by rw new_mul_comm n
    ... = new_mul (new_mul (nat_to_power n l) n) (nat_to_power m (succ l)) : by rw new_mul_assoc
    ... = (new_mul (nat_to_power n (succ l)) (nat_to_power m (succ l))) : by rw (succ_power_mul n l))

theorem nat_product_addition (n m l : ℕ) : new_mul (nat_to_power n m) (nat_to_power n l) = nat_to_power n (m + l) :=
nat.rec_on m
(show  new_mul (nat_to_power n 0) (nat_to_power n l) = nat_to_power n (0 + l), from calc
new_mul (nat_to_power n 0) (nat_to_power n l) = new_mul 1 (nat_to_power n l) : by rw any_power_of_zero_is_one
... = (nat_to_power n l) : by rw any_numb_times_one_is_numb
... = (nat_to_power n (0 + l)) : by rw nat.zero_add)
(assume m ih, show new_mul (nat_to_power n (succ m)) (nat_to_power n l) = nat_to_power n ((succ m) + l), from calc
    new_mul (nat_to_power n (succ m)) (nat_to_power n l) = new_mul (new_mul (nat_to_power n m) n) (nat_to_power n l) : by rw succ_power_mul
    ... = new_mul (new_mul n (nat_to_power n m)) (nat_to_power n l) : by rw new_mul_comm n
    ... = new_mul n (new_mul (nat_to_power n m) (nat_to_power n l)) : by rw new_mul_assoc
    ... =  new_mul n (nat_to_power n (m + l)) : by rw ih
    ... =  new_mul (nat_to_power n (m + l)) n : by rw new_mul_comm
    ... =  (nat_to_power n (succ (m + l))) : by rw succ_power_mul  
    ... =  (nat_to_power n  ((succ m) + l)) : by rw nat.succ_add)

theorem nat_exponent_product (n m l : ℕ) : nat_to_power (nat_to_power n m) l = nat_to_power n (new_mul m l) :=
nat.rec_on l
(show nat_to_power (nat_to_power n m) 0 = nat_to_power n (new_mul m 0), from calc
    nat_to_power (nat_to_power n m) 0 = 1 : by rw any_power_of_zero_is_one
    ... = nat_to_power n 0 : by rw ←any_power_of_zero_is_one
    ... = nat_to_power n (new_mul m 0) : by rw any_numb_times_zero_is_zero_rev)
(assume l ih, show nat_to_power (nat_to_power n m) (succ l) = nat_to_power n (new_mul m (succ l)), from calc
   nat_to_power (nat_to_power n m) (succ l) = 
        new_mul (nat_to_power (nat_to_power n m) l) (nat_to_power n m) : by rw succ_power_mul
   ... = new_mul (nat_to_power n (new_mul m l)) (nat_to_power n m): by rw ih
   ... = nat_to_power n ( (new_mul m l) + m) : by rw nat_product_addition
   ... = nat_to_power n ( m + (new_mul m l) ) : by rw nat.add_comm 
   ... = nat_to_power n (new_mul m (succ l)) : by rw succ_plus_other_numb_rev)


end hidden_1



-- Excercise 2 ↑ above with list stuff

-- Excercise 3
inductive expression : Type 
| const : ℕ → expression
| var : ℕ → expression
| plus : expression → expression → expression
| times : expression → expression → expression 

def evaluate (e : expression) (var_map: ℕ → ℕ) : ℕ :=
expression.rec_on e
(assume n, show ℕ , from n)
(assume n, show ℕ , from (var_map n))
(assume e1 e2 n2 n3, show ℕ , from n2 + n3)
(assume e1 e2 n2 n3, show ℕ , from n2 * n3)

#reduce evaluate (expression.times (expression.var 1) (expression.plus (expression.const 5) (expression.const 5))) (λ s : ℕ, s)

-- Excercise 4

-- Could also define this by well-known complete set of connectives { AND, NOT }, { NAND }, { NOR } then use definitions to define the rest
inductive prop_expression : Type
| prop : Prop → prop_expression
--  The order here Matters! ℕ comes after prop constructor
| var : ℕ  → prop_expression
| not : prop_expression → prop_expression
| and : prop_expression → prop_expression → prop_expression
| or : prop_expression → prop_expression → prop_expression

def evaluate_p (e : prop_expression) (var_map: ℕ → Prop) : Prop :=
prop_expression.rec_on e
(assume p, show Prop, from p)
(assume n, show Prop, from (var_map n))
(assume e1 p, show Prop, from ¬p)
(assume e1 e2 p1 p2, show Prop, from p1 ∧ p2)
(assume e1 e2 p1 p2, show Prop, from p1 ∨ p2)

#reduce evaluate_p (prop_expression.or (prop_expression.var 1) (prop_expression.prop true)) (λ n : ℕ, n == 2)


def complexity_p (e : prop_expression) : ℕ :=
prop_expression.rec_on e
(assume p, show ℕ, from 1)
(assume n, show ℕ, from 1)
(assume e1 ih, show ℕ, from succ ih)
(assume e1 e2 ih1 ih2, show ℕ, from ih1 + ih2)
(assume e1 e2 ih1 ih2, show ℕ, from ih1 + ih2)

#reduce complexity_p (prop_expression.or (prop_expression.or (prop_expression.var 1) (prop_expression.prop true)) (prop_expression.prop true))

def substitute_p_var (e : prop_expression) (var_index : ℕ) (subsitutee : prop_expression) : prop_expression :=
prop_expression.rec_on e
(assume p, show prop_expression, from prop_expression.prop p)
(assume n, show prop_expression, from or.by_cases (decidable.em (var_index = n))
    (assume eq : var_index = n, show prop_expression, from subsitutee)
    (assume neq : var_index ≠ n, show prop_expression, from prop_expression.var n)
)
(assume e1 ep, show prop_expression,  from prop_expression.not ep)
(assume e1 e2 ih_ep1 ih_ep2, show prop_expression, from prop_expression.and ih_ep1 ih_ep2)
(assume e1 e2 ih_ep1 ih_ep2, show prop_expression, from prop_expression.or ih_ep1 ih_ep2)

#reduce (prop_expression.or (prop_expression.or (prop_expression.var 1) (prop_expression.prop true)) (prop_expression.prop true))
#reduce substitute_p_var (prop_expression.or (prop_expression.or (prop_expression.var 1) (prop_expression.prop true)) (prop_expression.prop true)) 1 (prop_expression.prop true)

-- exercise 5

inductive vvvector (α : Type u) : nat → Type u
| nil {}                                : vvvector zero
| cons {n : ℕ} (a : α) (v : vvvector n) : vvvector (succ n)

mutual inductive even, odd
with even : ℕ → Prop
| even_zero : even 0
| even_succ : ∀ n, odd n → even (n + 1)
with odd : ℕ → Prop
| odd_succ : ∀ n, even n → odd (n + 1)


-- inductive even_ : ℕ → Prop
-- | zero : even_ 0
-- | even_succ : ∀ n, odd_ n → even_ (n + 1)

-- inductive odd_ : ℕ → Prop
-- | odd_succ : ∀ n, even_ n → odd_ (n + 1)

inductive o_e : Prop → ℕ → Prop
| zero : o_e true 0
| even_succ {n : ℕ}:  o_e false n → o_e true  (succ n)
| odd_succ  {n : ℕ}:  o_e true  n → o_e false (succ n)

#reduce o_e.even_succ (o_e.odd_succ o_e.zero)


-- inductive o_e : ℕ \


-- #reduce even_odd.even_succ (even_odd.even_zero)
-- #check  even_odd.even_succ (even_odd.even_zero)
-- #check even_odd.odd_succ (even_odd.even_zero)
