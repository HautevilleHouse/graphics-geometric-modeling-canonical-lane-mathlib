import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Fin.Basic

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

structure RenderingPipeline where
  vertexShader : Nat → Prop
  rasterization : Prop
  fragmentShader : Nat → Prop
  outputCorrectness : Prop
  pipelineComplete : Prop

def RenderingPipelineClosed (R : RenderingPipeline) : Prop :=
  R.pipelineComplete ∧ R.outputCorrectness ∧ (∀ n, R.vertexShader n) ∧ (∀ n, R.fragmentShader n)

theorem rendering_pipeline_closed_from_properties (R : RenderingPipeline) (h1 : R.pipelineComplete) (h2 : R.outputCorrectness) (h3 : ∀ n, R.vertexShader n) (h4 : ∀ n, R.fragmentShader n) : RenderingPipelineClosed R := by
  exact And.intro h1 (And.intro h2 (And.intro h3 h4))

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse