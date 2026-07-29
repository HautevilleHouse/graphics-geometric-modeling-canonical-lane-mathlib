import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

structure ParametricContinuityPackage where
  curveType : Type u
  continuityOrder : Nat
  geometricConditions : Prop
  reparameterizationInvariance : Prop
  compatibilityWithSpline : Prop

structure ParametricContinuityEvidence (C : ParametricContinuityPackage) where
  geometricConditionsClosed : C.geometricConditions
  reparameterizationInvarianceClosed : C.reparameterizationInvariance
  compatibilityWithSplineClosed : C.compatibilityWithSpline

def ParametricContinuityClosed (C : ParametricContinuityPackage) : Prop :=
  C.geometricConditions ∧ C.reparameterizationInvariance ∧ C.compatibilityWithSpline

theorem parametric_continuity_closed_from_evidence (C : ParametricContinuityPackage)
    (E : ParametricContinuityEvidence C) : ParametricContinuityClosed C := by
  exact And.intro E.geometricConditionsClosed
    (And.intro E.reparameterizationInvarianceClosed E.compatibilityWithSplineClosed)

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse
