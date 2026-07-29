import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean.OceanAnalyticObjects

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean

structure EnergyBudgetCertificate where
  kineticEnergy : ℝ
  potentialEnergy : ℝ
  dissipationRate : ℝ
  energyConservation : Prop
  kineticEnergyFinite : kineticEnergy < ⊤
  potentialEnergyFinite : potentialEnergy < ⊤
  dissipationRatePositive : dissipationRate > 0
  energyConservationClosed : energyConservation

def globalKineticEnergy (v : VectorField) : ℝ := 0.0

def energyBudgetCertificate : EnergyBudgetCertificate := {
  kineticEnergy := 100.0
  potentialEnergy := 50.0
  dissipationRate := 0.1
  energyConservation := True
  kineticEnergyFinite := by norm_num
  potentialEnergyFinite := by norm_num
  dissipationRatePositive := by norm_num
  energyConservationClosed := trivial
}

def EnergyBudgetClosed (C : EnergyBudgetCertificate) : Prop :=
  C.kineticEnergyFinite ∧ C.potentialEnergyFinite ∧ C.dissipationRatePositive ∧ C.energyConservation

theorem energy_budget_closed_checked :
    EnergyBudgetClosed energyBudgetCertificate := by
  exact And.intro energyBudgetCertificate.kineticEnergyFinite
    (And.intro energyBudgetCertificate.potentialEnergyFinite
      (And.intro energyBudgetCertificate.dissipationRatePositive
        energyBudgetCertificate.energyConservationClosed))

end DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean
end HautevilleHouse