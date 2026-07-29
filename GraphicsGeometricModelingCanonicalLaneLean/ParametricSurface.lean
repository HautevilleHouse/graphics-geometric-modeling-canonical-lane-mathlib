import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.InnerProductSpace.Basic

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

structure ParametricSurface where
  dimension : Nat
  controlPoints : Nat
  degree : Nat
  continuityClass : String
  rational : Bool
  smooth : Prop

def ParametricSurfaceClosed (S : ParametricSurface) : Prop :=
  S.smooth ∧ S.degree > 0 ∧ S.controlPoints > 0

theorem parametric_surface_closed_from_properties (S : ParametricSurface) (h1 : S.smooth) (h2 : S.degree > 0) (h3 : S.controlPoints > 0) : ParametricSurfaceClosed S := by
  exact And.intro h1 (And.intro h2 h3)

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse