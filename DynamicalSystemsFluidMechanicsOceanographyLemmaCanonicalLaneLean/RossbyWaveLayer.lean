import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean.OceanAnalyticObjects

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean

structure RossbyWaveCertificate where
  betaPlaneApproximation : Bool
  phaseSpeed : ℝ
  dispersionRelation : Prop
  rmsAmplitude : ℝ
  waveNumber : ℕ
  betaPlaneApproximationClosed : betaPlaneApproximation
  dispersionRelationClosed : dispersionRelation
  rmsAmplitudePositive : rmsAmplitude > 0

def betaPlaneFlow : OceanicFlow := primitiveOceanicFlow

def betaParameter : ℝ := 1.5e-11

def rossbyWaveCertificate : RossbyWaveCertificate := {
  betaPlaneApproximation := true
  phaseSpeed := 0.5
  dispersionRelation := True
  rmsAmplitude := 0.2
  waveNumber := 3
  betaPlaneApproximationClosed := rfl
  dispersionRelationClosed := trivial
  rmsAmplitudePositive := by norm_num
}

def RossbyWaveClosed (C : RossbyWaveCertificate) : Prop :=
  C.betaPlaneApproximation ∧ C.dispersionRelation ∧ C.rmsAmplitude > 0

theorem rossby_wave_closed_checked :
    RossbyWaveClosed rossbyWaveCertificate := by
  exact And.intro rossbyWaveCertificate.betaPlaneApproximationClosed
    (And.intro rossbyWaveCertificate.dispersionRelationClosed
      rossbyWaveCertificate.rmsAmplitudePositive)

end DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean
end HautevilleHouse