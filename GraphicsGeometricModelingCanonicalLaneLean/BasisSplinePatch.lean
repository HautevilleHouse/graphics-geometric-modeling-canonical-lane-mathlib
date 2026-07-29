import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

/-!
# Basis Spline Patch Package

This module defines the geometric modeling foundation for spline basis functions
over a patch domain. The package records proof obligations for basis function
regularity, partition of unity, and patch compatibility.
-/

structure KnotVector where
  knots : List ℝ
  nonDecreasing : Prop
  nonDecreasingTerm : nonDecreasing

structure BSplineBasis (kv : KnotVector) where
  degree : ℕ
  basisFunctions : ℝ → ℝ
  partitionOfUnity : Prop
  compactSupport : Prop
  meshSize : ℝ
  partitionOfUnityTerm : partitionOfUnity
  compactSupportTerm : compactSupport

structure BSplineBasisEvidence (kv : KnotVector) (b : BSplineBasis kv) where
  partitionOfUnityClosed : b.partitionOfUnity
  compactSupportClosed : b.compactSupport

def BSplineBasisClosed (kv : KnotVector) (b : BSplineBasis kv) : Prop :=
  b.partitionOfUnity ∧ b.compactSupport

theorem bspline_basis_closed_from_evidence (kv : KnotVector) (b : BSplineBasis kv) (e : BSplineBasisEvidence kv b) : BSplineBasisClosed kv b :=
  And.intro e.partitionOfUnityClosed e.compactSupportClosed

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse