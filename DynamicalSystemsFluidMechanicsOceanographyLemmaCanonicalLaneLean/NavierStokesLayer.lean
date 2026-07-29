import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean.FluidFlowAdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean

structure NavierStokesFlow where
  velocity : ℝ → ℝ → ℝ
  pressure : ℝ → ℝ → ℝ
  viscosity : ℝ

def incompressible (F : NavierStokesFlow) : Prop :=
  ∀ x : ℝ, ∇ · F.velocity x = 0

def momentumEquation (F : NavierStokesFlow) : Prop :=
  ∀ t x : ℝ, ∂_t F.velocity t x + (F.velocity t x · ∇) F.velocity t x = -∇ F.pressure t x + F.viscosity * Δ F.velocity t x

def NavierStokesWellPosed (F : NavierStokesFlow) : Prop :=
  incompressible F ∧ momentumEquation F

structure NavierStokesCertificate where
  flow : NavierStokesFlow
  wellPosed : NavierStokesWellPosed flow
  closureProof : wellPosed

def sourceNavierStokesFlow : NavierStokesFlow := {
  velocity := λ t x => 0
  pressure := λ t x => 0
  viscosity := 1
}

theorem source_incompressible : incompressible sourceNavierStokesFlow := by
  intro x
  simp [incompressible, sourceNavierStokesFlow]

theorem source_momentum_equation : momentumEquation sourceNavierStokesFlow := by
  intro t x
  simp [momentumEquation, sourceNavierStokesFlow]

theorem source_navier_stokes_well_posed : NavierStokesWellPosed sourceNavierStokesFlow := by
  exact And.intro source_incompressible source_momentum_equation

def sourceNavierStokesCertificate : NavierStokesCertificate := {
  flow := sourceNavierStokesFlow
  wellPosed := source_navier_stokes_well_posed
  closureProof := source_navier_stokes_well_posed
}

end DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean
end HautevilleHouse
