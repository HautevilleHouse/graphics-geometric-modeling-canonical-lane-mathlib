import GraphicsGeometricModelingCanonicalLaneLean.MeshProcessing

/-!
# Curve and Surface Modeling Package
-/

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

structure CurveSurfaceModelingPackage where
  curveType : Type u
  surfaceType : Type v
  bezierRepresentation : Prop
  bSplineRepresentation : Prop
  nurbsRepresentation : Prop
  continuityConditions : Prop

structure CurveSurfaceModelingEvidence (C : CurveSurfaceModelingPackage) where
  bezierRepresentationClosed : C.bezierRepresentation
  bSplineRepresentationClosed : C.bSplineRepresentation
  nurbsRepresentationClosed : C.nurbsRepresentation
  continuityConditionsClosed : C.continuityConditions

def CurveSurfaceModelingClosed (C : CurveSurfaceModelingPackage) : Prop :=
  C.bezierRepresentation ∧ C.bSplineRepresentation ∧ C.nurbsRepresentation ∧ C.continuityConditions

theorem curve_surface_modeling_closed_from_evidence (C : CurveSurfaceModelingPackage) (E : CurveSurfaceModelingEvidence C) :
    CurveSurfaceModelingClosed C := by
  exact And.intro E.bezierRepresentationClosed (And.intro E.bSplineRepresentationClosed (And.intro E.nurbsRepresentationClosed E.continuityConditionsClosed))

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse