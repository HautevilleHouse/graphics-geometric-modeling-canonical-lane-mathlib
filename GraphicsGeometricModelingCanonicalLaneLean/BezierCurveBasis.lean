import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGeometricModelingCanonicalLaneLean

structure BezierCurveBasisPackage where
  controlPoints : Nat
  bernsteinDegree : Nat
  basisFunctionsDefined : Prop
  partitionOfUnity : Prop
  derivativeRecurrence : Prop

structure BezierCurveBasisEvidence (B : BezierCurveBasisPackage) where
  basisFunctionsDefinedClosed : B.basisFunctionsDefined
  partitionOfUnityClosed : B.partitionOfUnity
  derivativeRecurrenceClosed : B.derivativeRecurrence

def BezierCurveBasisClosed (B : BezierCurveBasisPackage) : Prop :=
  B.basisFunctionsDefined ∧ B.partitionOfUnity ∧ B.derivativeRecurrence

theorem bezier_curve_basis_closed_from_evidence (B : BezierCurveBasisPackage)
    (E : BezierCurveBasisEvidence B) : BezierCurveBasisClosed B := by
  exact And.intro E.basisFunctionsDefinedClosed
    (And.intro E.partitionOfUnityClosed E.derivativeRecurrenceClosed)

end GraphicsGeometricModelingCanonicalLaneLean
end HautevilleHouse
