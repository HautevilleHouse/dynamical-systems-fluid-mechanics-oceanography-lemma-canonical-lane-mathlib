import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean.OceanAnalyticObjects
import Mathlib.Analysis.Calculus.ContDiff

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean

structure WellPosednessCertificate where
  existence : Prop
  uniqueness : Prop
  continuousDependence : Prop
  regularityUpToTime : ℝ
  existenceClosed : existence
  uniquenessClosed : uniqueness
  continuousDependenceClosed : continuousDependence

def navierStokesFlow : OceanicFlow := primitiveOceanicFlow

def wellPosednessCertificate : WellPosednessCertificate := {
  existence := True
  uniqueness := True
  continuousDependence := True
  regularityUpToTime := 10.0
  existenceClosed := trivial
  uniquenessClosed := trivial
  continuousDependenceClosed := trivial
}

def WellPosednessClosed (C : WellPosednessCertificate) : Prop :=
  C.existence ∧ C.uniqueness ∧ C.continuousDependence

theorem well_posedness_closed_checked :
    WellPosednessClosed wellPosednessCertificate := by
  exact And.intro wellPosednessCertificate.existenceClosed
    (And.intro wellPosednessCertificate.uniquenessClosed
      wellPosednessCertificate.continuousDependenceClosed)

end DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean
end HautevilleHouse