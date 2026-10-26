#!/usr/bin/env python3
"""Tests of mathematical identities only; NO fitted physics or toy-as-empirical data."""
import unittest
import numpy as np
from ui_kernel import (full_rotation, generate, inverse_direction, diagnostics,
                       minimal_rotation_from_e0, symbolic_identity)

class UIKernelTests(unittest.TestCase):
    def test_symbolic_decomposition(self):
        self.assertEqual(symbolic_identity()['one_plane_exact_residual'],'0')

    def test_SO4_proper_rotation(self):
        theta=np.array([.3,-.4,.2,.6,-.2,.1]) # numeric fixture ONLY for an identity test
        R=full_rotation(theta)
        self.assertLess(np.max(np.abs(R.T@R-np.eye(4))),1e-13)
        self.assertAlmostEqual(np.linalg.det(R),1.,places=12)

    def test_one_plane_unit_circle(self):
        s=np.linspace(0,2*np.pi,1001)
        angles=np.zeros((len(s),6));angles[:,0]=s
        X,R=generate(s,np.ones_like(s),angles)
        self.assertLess(np.max(np.abs(X[:,0]-np.cos(s))),1e-12)
        self.assertLess(np.max(np.abs(X[:,1]-np.sin(s))),1e-12)
        q,u=inverse_direction(X)
        self.assertTrue(np.allclose(q,1.,atol=1e-12))
        d=diagnostics(X,s)
        self.assertLess(d['numerical_checks']['max_velocity_split_error_interior'],2e-4)
        self.assertAlmostEqual(d['integrals']['I_stretch'],np.pi,delta=3e-4)
        self.assertAlmostEqual(d['integrals']['I_bend'],np.pi,delta=3e-3)
        self.assertAlmostEqual(d['integrals']['I_director'],0.,delta=1e-12)

    def test_inverse_frame_gauge(self):
        for b in ([.5,.5,.5,.5],[-1.,0.,0.,0.],[1.,0.,0.,0.]):
            R=minimal_rotation_from_e0(np.array(b,float))
            target=np.array(b,float)/np.linalg.norm(b)
            self.assertTrue(np.allclose(R@np.array([1.,0.,0.,0.]),target))
            self.assertAlmostEqual(np.linalg.det(R),1.,places=10)

    def test_global_rotation_preserves_diagnostics_except_director(self):
        s=np.linspace(.1,3.,400)
        angles=np.zeros((len(s),6));angles[:,0]=2*s;angles[:,2]=.4*s
        X,_=generate(s,1.+.1*s,angles)
        Q=full_rotation(np.array([.1,-.5,.3,.2,-.9,.8]))
        a=diagnostics(X,s);b=diagnostics(X@Q.T,s)
        self.assertAlmostEqual(a['integrals']['I_stretch'],b['integrals']['I_stretch'],places=10)
        self.assertAlmostEqual(a['integrals']['I_bend'],b['integrals']['I_bend'],places=10)

    def test_no_material_specific_outputs(self):
        result=symbolic_identity()
        self.assertEqual(result['independent_SiC_observables'],'NONE')

if __name__ == '__main__':
    unittest.main(verbosity=2)
