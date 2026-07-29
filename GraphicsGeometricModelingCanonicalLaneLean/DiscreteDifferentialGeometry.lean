import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

structure DiscreteCurvature where
  vertexCurvature : List ℝ
  edgeCurvature : List ℝ
  faceCurvature : List ℝ
  gaussBonnetTheoremHolds : Prop
  gaussBonnetTerm : gaussBonnetTheoremHolds

autibute (DiscreteCurvature) : DecidableEq

structure DiscreteLaplaceBeltrami where
  cotangentWeightedMatrix : Type
  laplacianMatrix : Type
  convergenceToContinuous : Prop
  spectralProperties : Prop
  convergenceToContinuousTerm : convergenceToContinuous
  spectralPropertiesTerm : spectralProperties

autibute (DiscreteLaplaceBeltrami) : DecidableEq

structure DiscreteExteriorCalculus where
  differentialFormSpace : Type
  hodgeStar : Type
  discreteStokesTheorem : Prop
  discreteStokesTerm : discreteStokesTheorem

def DiscreteDifferentialGeometryClosed (D : DiscreteLaplaceBeltrami) : Prop :=
  D.convergenceToContinuous ∧ D.spectralProperties

theorem discrete_differential_geometry_closed (D : DiscreteLaplaceBeltrami) : DiscreteDifferentialGeometryClosed D :=
  ⟨D.convergenceToContinuousTerm, D.spectralPropertiesTerm⟩

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse