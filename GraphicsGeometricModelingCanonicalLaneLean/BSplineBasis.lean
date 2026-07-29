import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

structure BSplineBasis where
  degree : ℕ
  knotVector : List ℝ
  basisFunctions : List (ℝ → ℝ)
  partitionOfUnity : Prop
  localSupport : Prop
  smoothness : Prop
  recursionRelation : Prop
  partitionOfUnityTerm : partitionOfUnity
  localSupportTerm : localSupport
  smoothnessTerm : smoothness
  recursionRelationTerm : recursionRelation

structure NURBSBasis (B : BSplineBasis) where
  weights : List ℝ
  rationalBasisFunctions : List (ℝ → ℝ)
  partitionOfUnityWeights : Prop
  rationalPartitionOfUnityTerm : partitionOfUnityWeights

def BSplineBasisClosed (B : BSplineBasis) : Prop :=
  B.partitionOfUnity ∧ B.localSupport ∧ B.smoothness ∧ B.recursionRelation

theorem b_spline_basis_closed_from_evidence (B : BSplineBasis) : BSplineBasisClosed B :=
  ⟨B.partitionOfUnityTerm, B.localSupportTerm, B.smoothnessTerm, B.recursionRelationTerm⟩

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse