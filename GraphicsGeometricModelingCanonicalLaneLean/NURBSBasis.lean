import canonicalLaneMathlib.AdmissibleClass

/-!
# NURBS Basis Functions Package

This module defines the rational B-spline basis functions that form the foundation
of NURBS (Non-Uniform Rational B-Splines) geometry. The package records the
properties of the basis: partition of unity, non-negativity, local support, and
rational weight assignment.
-/

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

structure NURBSBasisPackage where
  degree : Nat
  knots : List Double
  controlPoints : List (Double × Double × Double)
  weights : List Double
  partitionOfUnity : Prop
  nonNegativity : Prop
  localSupport : Prop
  rationalBasisEvaluated : Prop

structure NURBSBasisEvidence (B : NURBSBasisPackage) where
  partitionOfUnityClosed : B.partitionOfUnity
  nonNegativityClosed : B.nonNegativity
  localSupportClosed : B.localSupport
  rationalBasisEvaluatedClosed : B.rationalBasisEvaluated

def NURBSBasisClosed (B : NURBSBasisPackage) : Prop :=
  B.partitionOfUnity ∧ B.nonNegativity ∧ B.localSupport ∧ B.rationalBasisEvaluated

theorem nurbs_basis_closed_from_evidence (B : NURBSBasisPackage) (E : NURBSBasisEvidence B) : NURBSBasisClosed B := by
  exact And.intro E.partitionOfUnityClosed
    (And.intro E.nonNegativityClosed
      (And.intro E.localSupportClosed E.rationalBasisEvaluatedClosed))

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse
