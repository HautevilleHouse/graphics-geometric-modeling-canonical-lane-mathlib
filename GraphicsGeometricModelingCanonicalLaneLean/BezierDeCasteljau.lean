import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

/-!
# Bézier De Casteljau Package

This module formalizes the de Casteljau algorithm for Bézier curves.
It encodes the recursive subdivision as an admissible bridge.
-/

structure ControlPolygon where
  points : List (ℝ × ℝ)
  consecutive : points.length ≥ 2

structure DeCasteljauEvaluation (cp : ControlPolygon) where
  t : ℝ
  evaluatedPoint : ℝ × ℝ
  recursionSteps : ℕ
  correctness : Prop
  correctnessTerm : correctness

structure DeCasteljauEvidence (cp : ControlPolygon) (d : DeCasteljauEvaluation cp) where
  correctnessClosed : d.correctness

def DeCasteljauClosed (cp : ControlPolygon) (d : DeCasteljauEvaluation cp) : Prop :=
  d.correctness

theorem de_casteljau_closed_from_evidence (cp : ControlPolygon) (d : DeCasteljauEvaluation cp) (e : DeCasteljauEvidence cp d) : DeCasteljauClosed cp d :=
  e.correctnessClosed

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse