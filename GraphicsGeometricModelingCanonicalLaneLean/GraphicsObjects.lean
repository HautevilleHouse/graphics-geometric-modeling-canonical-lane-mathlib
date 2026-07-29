import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

structure GraphicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure GraphicsAdmittedObject where
  space : GraphicsSpace
  compact : Prop
  orientable : Prop
  genus : Nat
  meshComplexity : Nat
  parameterizationExists : Prop
  conclusion : parameterizationExists

structure GraphicsEndgameState where
  object : GraphicsAdmittedObject

def GraphicsWitnessClosed (O : GraphicsAdmittedObject) : Prop :=
  O.parameterizationExists

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse