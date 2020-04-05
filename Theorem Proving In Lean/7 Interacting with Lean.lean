

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

inductive list (α : Type u)
| nil {} : list
| cons : α → list → list

variable {α : Type}

notation h :: t  := list.cons h t

def append (s t : list α) : list α :=
list.rec t (λ x l u, x::u) s

notation s ++ t := append s t

theorem nil_append (t : list α) : list.nil ++ t = t := rfl
theorem cons_append (x : α) (s t : list α) :
  x::s ++ t = x::(s ++ t) := rfl

  notation `[` l:(foldr `,` (h t, list.cons h t) list.nil) `]` := l

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
theorem append_assoc (r s t : C.list α) :
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

end C

