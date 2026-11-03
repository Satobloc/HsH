import HsHVerification.MercerS2GaugeLift

/-!
# Mercer S2: formal product-rule angular-rate decomposition
In a matrix ring, write d(RQ)=dR Q+R dQ. If Q*Qinv=1, then
(dR Q+R dQ)(Qinv Rinv) = dR Rinv + R(dQ Qinv)Rinv.
The second term is an unobserved stabilizer-frame-rate freedom unless
an independent material-director or connection constraint fixes Q(t).
The derivative premise is NOT proved here, nor are physical premises.
-/
namespace HsHVerification.MercerS2GaugeRate

theorem frame_rate_product_decomposition
    {A : Type*} [Ring A]
    (R Q dR dQ invR invQ : A) (hQ : Q * invQ = 1) :
    (dR * Q + R * dQ) * (invQ * invR) =
      dR * invR + R * (dQ * invQ) * invR := by
  calc
    (dR * Q + R * dQ) * (invQ * invR)
        = (dR * Q) * (invQ * invR) +
          (R * dQ) * (invQ * invR) := by rw [add_mul]
    _ = dR * (Q * invQ) * invR + R * (dQ * invQ) * invR := by
      simp only [mul_assoc]
    _ = dR * invR + R * (dQ * invQ) * invR := by simp [hQ]

theorem stationary_gauge_has_zero_rate_term
    {A : Type*} [Ring A] (R invR invQ : A) :
    R * ((0 : A) * invQ) * invR = 0 := by simp

#print axioms frame_rate_product_decomposition
#print axioms stationary_gauge_has_zero_rate_term
end HsHVerification.MercerS2GaugeRate
