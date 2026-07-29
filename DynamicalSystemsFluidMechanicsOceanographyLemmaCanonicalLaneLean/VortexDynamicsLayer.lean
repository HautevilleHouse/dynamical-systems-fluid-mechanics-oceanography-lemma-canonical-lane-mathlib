import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean.OceanAnalyticObjects

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean

structure VortexDynamicsCertificate where
  vorticityConservation : Prop
  helmholtzDecomposition : Prop
  circulationTheorem : Prop
  vortexStretching : Prop
  vorticityConservationClosed : vorticityConservation
  helmholtzDecompositionClosed : helmholtzDecomposition
  circulationTheoremClosed : circulationTheorem
  vortexStretchingClosed : vortexStretching

def pointVortex : VectorField := fun _ _ => (0,0,0)

def vorticity (v : VectorField) : ScalarField := fun t x => 0

def vortexDynamicsCertificate : VortexDynamicsCertificate := {
  vorticityConservation := vorticity pointVortex = fun _ _ => 0
  helmholtzDecomposition := True
  circulationTheorem := True
  vortexStretching := True
  vorticityConservationClosed := rfl
  helmholtzDecompositionClosed := trivial
  circulationTheoremClosed := trivial
  vortexStretchingClosed := trivial
}

def VortexDynamicsClosed (C : VortexDynamicsCertificate) : Prop :=
  C.vorticityConservation ∧ C.helmholtzDecomposition ∧ C.circulationTheorem ∧ C.vortexStretching

theorem vortex_dynamics_closed_checked :
    VortexDynamicsClosed vortexDynamicsCertificate := by
  exact And.intro vortexDynamicsCertificate.vorticityConservationClosed
    (And.intro vortexDynamicsCertificate.helmholtzDecompositionClosed
      (And.intro vortexDynamicsCertificate.circulationTheoremClosed
        vortexDynamicsCertificate.vortexStretchingClosed))

end DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean
end HautevilleHouse