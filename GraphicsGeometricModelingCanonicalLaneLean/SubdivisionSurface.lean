import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

structure SubdivisionScheme where
  splitRule : Type
  averagingRule : Type
  subdivisionMatrix : Type
  convergence : Prop
  smoothnessLimit : Prop
  stationary : Prop
  convergenceTerm : convergence
  smoothnessLimitTerm : smoothnessLimit
  stationaryTerm : stationary

structure CatmullClarkScheme extends SubdivisionScheme where
  faceSplit : Prop
  vertexUpdate : Prop
  edgeUpdate : Prop
  faceSplitTerm : faceSplit
  vertexUpdateTerm : vertexUpdate
  edgeUpdateTerm : edgeUpdate

structure LoopScheme extends SubdivisionScheme where
  triangleSplit : Prop
  vertexUpdate : Prop
  edgeUpdate : Prop
  triangleSplitTerm : triangleSplit
  vertexUpdateTerm : vertexUpdate
  edgeUpdateTerm : edgeUpdate

def SubdivisionConvergenceClosed (S : SubdivisionScheme) : Prop :=
  S.convergence ∧ S.smoothnessLimit ∧ S.stationary

theorem subdivision_convergence_closed (S : SubdivisionScheme) : SubdivisionConvergenceClosed S :=
  ⟨S.convergenceTerm, S.smoothnessLimitTerm, S.stationaryTerm⟩

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse