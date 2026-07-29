import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

structure ParametricDomain where
  uRange : ℝ × ℝ
  vRange : ℝ × ℝ
  closedU : Prop
  closedV : Prop

autibute (ParametricDomain) : DecidableEq

structure ParametricCurve where
  domain : ℝ → ℝ → ℝ × ℝ × ℝ
  domainRange : ℝ × ℝ
  derivative : ℝ → ℝ × ℝ × ℝ
  continuous : Prop
  differentiable : Prop
  regularity : Prop
  continuousTerm : continuous
  differentiableTerm : differentiable
  regularityTerm : regularity

structure ParametricSurface where
  domain : ParametricDomain
  mapping : ℝ × ℝ → ℝ × ℝ × ℝ
  partialDerivatives : (ℝ × ℝ → ℝ × ℝ × ℝ) × (ℝ × ℝ → ℝ × ℝ × ℝ)
  normal : ℝ × ℝ → ℝ × ℝ × ℝ
  continuous : Prop
  differentiable : Prop
  regular : Prop
  continuousTerm : continuous
  differentiableTerm : differentiable
  regularTerm : regular

structure RationalBezierSurface (B : BSplineBasis) extends ParametricSurface where
  weights : List (List ℝ)
  rationalMapping : Prop
  rationalMappingTerm : rationalMapping

def ParametricCurveClosed (C : ParametricCurve) : Prop :=
  C.continuous ∧ C.differentiable ∧ C.regularity

def ParametricSurfaceClosed (S : ParametricSurface) : Prop :=
  S.continuous ∧ S.differentiable ∧ S.regular

theorem parametric_curve_closed (C : ParametricCurve) : ParametricCurveClosed C :=
  ⟨C.continuousTerm, C.differentiableTerm, C.regularityTerm⟩

theorem parametric_surface_closed (S : ParametricSurface) : ParametricSurfaceClosed S :=
  ⟨S.continuousTerm, S.differentiableTerm, S.regularTerm⟩

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse