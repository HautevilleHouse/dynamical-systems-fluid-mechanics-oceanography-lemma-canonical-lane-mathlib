import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean.NavierStokesLayer

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean

structure EulerFlow where
  velocity : ℝ → ℝ → ℝ
  pressure : ℝ → ℝ → ℝ

def eulerEquation (F : EulerFlow) : Prop :=
  ∀ t x : ℝ, ∂_t F.velocity t x + (F.velocity t x · ∇) F.velocity t x = -∇ F.pressure t x

def EulerWellPosed (F : EulerFlow) : Prop :=
  incompressible { velocity := F.velocity, pressure := F.pressure, viscosity := 0 } ∧ eulerEquation F

structure EulerCertificate where
  flow : EulerFlow
  wellPosed : EulerWellPosed flow
  closureProof : wellPosed

def sourceEulerFlow : EulerFlow := {
  velocity := λ t x => 0
  pressure := λ t x => 0
}

theorem source_euler_incompressible : incompressible { velocity := sourceEulerFlow.velocity, pressure := sourceEulerFlow.pressure, viscosity := 0 } := by
  intro x
  simp [incompressible, sourceEulerFlow]

theorem source_euler_equation : eulerEquation sourceEulerFlow := by
  intro t x
  simp [eulerEquation, sourceEulerFlow]

theorem source_euler_well_posed : EulerWellPosed sourceEulerFlow := by
  exact And.intro source_euler_incompressible source_euler_equation

def sourceEulerCertificate : EulerCertificate := {
  flow := sourceEulerFlow
  wellPosed := source_euler_well_posed
  closureProof := source_euler_well_posed
}

end DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean
end HautevilleHouse
