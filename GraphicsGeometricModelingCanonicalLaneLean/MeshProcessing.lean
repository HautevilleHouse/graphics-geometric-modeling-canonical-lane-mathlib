import GraphicsGeometricModelingCanonicalLaneLean.AdmissibleClass

/-!
# Mesh Processing Package
-/

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

structure MeshProcessingPackage where
  meshType : Type u
  subdivisionScheme : Prop
  smoothingOperator : Prop
  remeshingAlgorithm : Prop
  qualityMetrics : Prop

structure MeshProcessingEvidence (M : MeshProcessingPackage) where
  subdivisionSchemeClosed : M.subdivisionScheme
  smoothingOperatorClosed : M.smoothingOperator
  remeshingAlgorithmClosed : M.remeshingAlgorithm
  qualityMetricsClosed : M.qualityMetrics

def MeshProcessingClosed (M : MeshProcessingPackage) : Prop :=
  M.subdivisionScheme ∧ M.smoothingOperator ∧ M.remeshingAlgorithm ∧ M.qualityMetrics

theorem mesh_processing_closed_from_evidence (M : MeshProcessingPackage) (E : MeshProcessingEvidence M) :
    MeshProcessingClosed M := by
  exact And.intro E.subdivisionSchemeClosed (And.intro E.smoothingOperatorClosed (And.intro E.remeshingAlgorithmClosed E.qualityMetricsClosed))

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse