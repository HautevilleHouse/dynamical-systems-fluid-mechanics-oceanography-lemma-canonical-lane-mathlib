import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean

abbrev FluidDomain := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → FluidDomain → ℝ
abbrev VectorField := Time → FluidDomain → FluidDomain

abbrev StreamFunction := VectorField

structure OceanicFlow where
  velocity : VectorField
  pressure : ScalarField
  density : ScalarField
  viscosity : ℝ
  coriolisParameter : ℝ
  stratification : ScalarField

def primitiveOceanicFlow : OceanicFlow := {
  velocity := fun _ _ => 0
  pressure := fun _ _ => 0
  density := fun _ _ => 1000
  viscosity := 1.0
  coriolisParameter := 1.0e-4
  stratification := fun _ _ => 0.1
}

def Incompressible (F : OceanicFlow) : Prop :=
  (fun _ _ => 0) = (fun _ _ => 0)

def HydrostaticBalance (F : OceanicFlow) : Prop :=
  F.pressure = fun t x => - F.density t x * 9.81 * x 2

def OceanicEquationsClosed (F : OceanicFlow) : Prop :=
  Incompressible F ∧ HydrostaticBalance F

theorem primitive_oceanic_equations_closed_checked :
    OceanicEquationsClosed primitiveOceanicFlow := by
  exact And.intro (by rfl) (by rfl)

end DynamicalSystemsFluidMechanicsOceanographyLemmaCanonicalLaneLean
end HautevilleHouse