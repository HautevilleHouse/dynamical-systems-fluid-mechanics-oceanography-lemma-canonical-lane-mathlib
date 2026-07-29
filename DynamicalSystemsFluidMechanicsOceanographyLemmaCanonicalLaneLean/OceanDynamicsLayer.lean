import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean.EulerEquationLayer

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean

structure OceanFlow where
  velocity : ℝ → ℝ → ℝ
  density : ℝ → ℝ → ℝ
  coriolis : ℝ
  gravity : ℝ

def shallowWaterEquations (F : OceanFlow) : Prop :=
  (∀ t x : ℝ, ∂_t F.velocity t x + (F.velocity t x · ∇) F.velocity t x + coriolisTerm F.coriolis F.velocity t x = -gravity * ∇ F.density t x) ∧
  (∀ t x : ℝ, ∂_t F.density t x + ∇ · (F.density t x * F.velocity t x) = 0)
  where
    coriolisTerm (f : ℝ) (v : ℝ → ℝ) (t x : ℝ) : ℝ := f * (v t x).⊥

def OceanWellPosed (F : OceanFlow) : Prop :=
  shallowWaterEquations F

structure OceanCertificate where
  flow : OceanFlow
  wellPosed : OceanWellPosed flow
  closureProof : wellPosed

def sourceOceanFlow : OceanFlow := {
  velocity := λ t x => 0
  density := λ t x => 1
  coriolis := 0
  gravity := 9.81
}

theorem source_shallow_water_equations : shallowWaterEquations sourceOceanFlow := by
  unfold shallowWaterEquations
  constructor
  · intro t x
    simp [sourceOceanFlow]
  · intro t x
    simp [sourceOceanFlow]

theorem source_ocean_well_posed : OceanWellPosed sourceOceanFlow := by
  exact source_shallow_water_equations

def sourceOceanCertificate : OceanCertificate := {
  flow := sourceOceanFlow
  wellPosed := source_ocean_well_posed
  closureProof := source_ocean_well_posed
}

end DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean
end HautevilleHouse
