import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

structure MeshVertex where
  index : ℕ
  position : ℝ × ℝ × ℝ

autibute (MeshVertex) : DecidableEq

structure MeshEdge where
  vertex1 : MeshVertex
  vertex2 : MeshVertex
  boundary : Prop

autibute (MeshEdge) : DecidableEq

structure MeshFace where
  vertices : List MeshVertex
  edges : List MeshEdge
  orientation : Prop

autibute (MeshFace) : DecidableEq

structure SimplicialComplex where
  vertices : List MeshVertex
  simplices : List (List ℕ)
  closureUnderFaces : Prop
  closureUnderFacesTerm : closureUnderFaces

structure ManifoldMesh extends SimplicialComplex where
  boundaryFree : Prop
  localEulerCharacteristicTwo : Prop
  orientable : Prop
  boundaryFreeTerm : boundaryFree
  localEulerCharacteristicTwoTerm : localEulerCharacteristicTwo
  orientableTerm : orientable

def ManifoldMeshClosed (M : ManifoldMesh) : Prop :=
  M.closureUnderFaces ∧ M.boundaryFree ∧ M.localEulerCharacteristicTwo ∧ M.orientable

theorem manifold_mesh_closed (M : ManifoldMesh) : ManifoldMeshClosed M :=
  ⟨M.closureUnderFacesTerm, M.boundaryFreeTerm, M.localEulerCharacteristicTwoTerm, M.orientableTerm⟩

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse