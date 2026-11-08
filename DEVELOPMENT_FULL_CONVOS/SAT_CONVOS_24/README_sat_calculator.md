# SAT / HSUCV Calculator

Run:

```bash
python sat_calculator.py
```

Examples:

```bash
python sat_calculator.py --B 0.23873241 --m0 1.0073e-27
python sat_calculator.py --G 6.67430e-11
python sat_calculator.py --J-eff 0.03265 --S 0.2621
python sat_calculator.py --G 6.67430e-11 --J-eff 0.03265 --S 0.2621
python sat_calculator.py --interactive
python sat_calculator.py --B 0.23873241 --json
```

The calculator preserves the supplied source's competing formulations,
including the deprecated linear mass law and the corrected mass law, rather
than silently replacing one with the other.
