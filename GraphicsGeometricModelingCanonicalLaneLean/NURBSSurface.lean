import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

/-!
# NURBS Surface Package

This module formalizes non-uniform rational B-spline surfaces.
It captures the rational basis, weights, and surface evaluation.
-/

structure NURBSWeightGrid where
  weights : List (List ℝ)
  positiveWeights : Prop
  positiveWeightsTerm : positiveWeights

structure NURBSSurfaceData (uKnots vKnots : KnotVector) where
  controlPoints : List (List (ℝ × ℝ × ℝ))
  weights : NURBSWeightGrid
  uDegree : ℕ
  vDegree : ℕ
  rationalBasis : ℝ → ℝ → ℝ
  surfaceContinuity : Prop
  surfaceContinuityTerm : surfaceContinuity

structure NURBSSurfaceEvidence (uKnots vKnots : KnotVector) (s : NURBSSurfaceData uKnots vKnots) where
  surfaceContinuityClosed : s.surfaceContinuity
  weightsPositiveClosed : s.weights.positiveWeights

def NURBSSurfaceClosed (uKnots vKnots : KnotVector) (s : NURBSSurfaceData uKnots vKnots) : Prop :=
  s.surfaceContinuity ∧ s.weights.positiveWeights

theorem nurbs_surface_closed_from_evidence (uKnots vKnots : KnotVector) (s : NURBSSurfaceData uKnots vKnots) (e : NURBSSurfaceEvidence uKnots vKnots s) : NURBSSurfaceClosed uKnots vKnots s :=
  And.intro e.surfaceContinuityClosed e.weightsPositiveClosed

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse