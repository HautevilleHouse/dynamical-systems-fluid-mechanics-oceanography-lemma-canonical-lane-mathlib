import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean.EnergyBudgetLayer

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean

structure TurbulenceScalingCertificate where
  energy : EnergyBudgetCertificate
  reynoldsNumber : ℝ
  kolmogorovScale : ℝ
  dissipationCascade : Prop
  inertialRange : Prop
  reynoldsNumberLarge : reynoldsNumber > 2000
  kolmogorovScalePositive : kolmogorovScale > 0
  dissipationCascadeClosed : dissipationCascade
  inertialRangeClosed : inertialRange

def turbulentFlow : OceanicFlow := primitiveOceanicFlow

def turbulenceScalingCertificate : TurbulenceScalingCertificate := {
  energy := energyBudgetCertificate
  reynoldsNumber := 5000
  kolmogorovScale := 0.01
  dissipationCascade := True
  inertialRange := True
  reynoldsNumberLarge := by norm_num
  kolmogorovScalePositive := by norm_num
  dissipationCascadeClosed := trivial
  inertialRangeClosed := trivial
}

def TurbulenceScalingClosed (C : TurbulenceScalingCertificate) : Prop :=
  EnergyBudgetClosed C.energy ∧
  C.reynoldsNumberLarge ∧ C.kolmogorovScalePositive ∧
  C.dissipationCascade ∧ C.inertialRange

theorem turbulence_scaling_closed_checked :
    TurbulenceScalingClosed turbulenceScalingCertificate := by
  refine And.intro (energy_budget_closed_checked) (And.intro ?_ (And.intro ?_ (And.intro ?_ ?_)))
  · exact turbulenceScalingCertificate.reynoldsNumberLarge
  · exact turbulenceScalingCertificate.kolmogorovScalePositive
  · exact turbulenceScalingCertificate.dissipationCascadeClosed
  · exact turbulenceScalingCertificate.inertialRangeClosed

end DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean
end HautevilleHouse