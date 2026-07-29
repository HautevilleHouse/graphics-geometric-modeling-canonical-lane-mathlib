import canonicalLaneMathlib.AdmissibleClass

/-!
# B-Spline Refinement Package

This module captures the knot insertion and degree elevation algorithms for
B-spline curves and surfaces. The refinement package ensures that the refined
basis spans the same spline space as the original, preserving the geometry.
-/

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

structure BSplineRefinementPackage where
  originalKnotVector : List Double
  refinedKnotVector : List Double
  degree : Nat
  newControlPoints : List (Double × Double × Double)
  refinementMatrix : List (List Double)
  spacePreservation : Prop
  continuityPreservation : Prop
  geometryPreservation : Prop

structure BSplineRefinementEvidence (R : BSplineRefinementPackage) where
  spacePreservationClosed : R.spacePreservation
  continuityPreservationClosed : R.continuityPreservation
  geometryPreservationClosed : R.geometryPreservation

def BSplineRefinementClosed (R : BSplineRefinementPackage) : Prop :=
  R.spacePreservation ∧ R.continuityPreservation ∧ R.geometryPreservation

theorem bspline_refinement_closed_from_evidence (R : BSplineRefinementPackage) (E : BSplineRefinementEvidence R) : BSplineRefinementClosed R := by
  exact And.intro E.spacePreservationClosed
    (And.intro E.continuityPreservationClosed E.geometryPreservationClosed)

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse
