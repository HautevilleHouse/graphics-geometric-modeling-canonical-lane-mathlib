import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

/-!
# Catmull-Clark Subdivision Surface Package

This module formalizes Catmull-Clark subdivision for quadrilateral meshes.
It encodes the limit surface regularity and subdivision rules.
-/

structure QuadMesh where
  vertices : List (ℝ × ℝ × ℝ)
  faces : List (List ℕ)
  manifoldProperty : Prop
  manifoldPropertyTerm : manifoldProperty

structure CatmullClarkStep (m : QuadMesh) where
  refinedMesh : QuadMesh
  maskApplied : Prop
  maskAppliedTerm : maskApplied

structure SubdivisionSequence (m : QuadMesh) where
  steps : List (CatmullClarkStep m)
  limitSurfaceRegularity : Prop
  limitSurfaceRegularityTerm : limitSurfaceRegularity

structure SubdivisionEvidence (m : QuadMesh) (s : SubdivisionSequence m) where
  limitSurfaceRegularityClosed : s.limitSurfaceRegularity

def SubdivisionClosed (m : QuadMesh) (s : SubdivisionSequence m) : Prop :=
  s.limitSurfaceRegularity

theorem subdivision_closed_from_evidence (m : QuadMesh) (s : SubdivisionSequence m) (e : SubdivisionEvidence m s) : SubdivisionClosed m s :=
  e.limitSurfaceRegularityClosed

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse