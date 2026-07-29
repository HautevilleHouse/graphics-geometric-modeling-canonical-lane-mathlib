import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

structure PrimitiveSurface (M : Type) [TopologicalSpace M] where
  carrier : M
  atlas : Type
  smoothCompatibility : Prop
  compact : Prop
  oriented : Prop
  smoothCompatibilityTerm : smoothCompatibility
  compactTerm : compact
  orientedTerm : oriented

structure PrimitiveControlNet (M : Type) [TopologicalSpace M] where
  controlPoints : List M
  knotVector : List ℝ
  degree : ℕ
  closed : Prop
  controlPointsNonEmpty : controlPoints ≠ []
  knotVectorNonDecreasing : ∀ i j, i ≤ j → knotVector.get? i ≤ knotVector.get? j

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse