import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean.FluidFlowAdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean.NavierStokesLayer
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean.EulerEquationLayer
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean.OceanDynamicsLayer

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean

def ConstrainedFluidClosure (A : FluidAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fluid_endgame (A : FluidAdmissibleClass) : ConstrainedFluidClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

theorem navier_stokes_admissible : NavierStokesWellPosed sourceNavierStokesFlow := by
  exact source_navier_stokes_well_posed

theorem euler_admissible : EulerWellPosed sourceEulerFlow := by
  exact source_euler_well_posed

theorem ocean_admissible : OceanWellPosed sourceOceanFlow := by
  exact source_ocean_well_posed

end DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean
end HautevilleHouse
