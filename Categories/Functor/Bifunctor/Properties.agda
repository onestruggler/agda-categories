{-# OPTIONS --without-K --safe #-}

module Categories.Functor.Bifunctor.Properties where

open import Level
open import Data.Product using (Σ; _,_)

open import Categories.Category
open import Categories.Functor
open import Categories.Functor.Bifunctor

private
  variable
    o ℓ e : Level
    C D E : Category o ℓ e

module _ (F : Bifunctor C D E) where
  module C = Category C
  module D = Category D
  module E = Category E
  
  private
    variable
      A B : C.Obj
      X Y : D.Obj
      f : A C.⇒ B
      g : X D.⇒ Y

  open E
  open HomReasoning
  open Functor F

  [_]-commute : F₁ (C.id , g) ∘ F₁ (f , D.id) ≈ F₁ (f , D.id) ∘ F₁ (C.id , g)
  [_]-commute {g = g} {f = f} = begin
    F₁ (C.id , g) ∘ F₁ (f , D.id) ≈˘⟨ homomorphism ⟩
    F₁ (C.id C.∘ f , g D.∘ D.id)  ≈⟨ F-resp-≈ (C.Equiv.sym C.id-comm , D.id-comm) ⟩
    F₁ (f C.∘ C.id , D.id D.∘ g)  ≈⟨ homomorphism ⟩
    F₁ (f , D.id) ∘ F₁ (C.id , g) ∎
