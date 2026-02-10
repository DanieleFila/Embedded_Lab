========================================================================
SECTION: MOTOR PARAMETER ESTIMATION (motorParameterEstimate.m)
========================================================================

DESCRIPTION
-----------
The script 'motorParameterEstimate.m' calculates the First Order Plus Time 
Delay (FOPTD) parameters (mu, tau, T) for both motors. It processes open-loop 
step response data acquired serially via the 'dataLogger.m' script.

The 'data' subfolder contains multiple acquisition files performed with 
different voltage ranges, all executed in "Forward & Coast" mode.

ESTIMATION METHODS
------------------
The script evaluates the parameters using two distinct approaches for comparison:

1. Graphical Method (Approximate):
   - Uses the 2% and 63.2% thresholds of the steady-state value.
   - Provides a quick, rough estimate of the system dynamics.

2. Tangent Method (Precise):
   - Uses a sequential mathematical approach based on the tangent at the 
     inflection point.
   - Delivers highly accurate parameter values.

OUTPUTS & VISUALIZATION
-----------------------
- Parameter Saving: Once calculated, the parameters (mu, tau, T) are 
  printed to the terminal and automatically saved to 'motors_params.txt'. 
  This allows re-use in subsequent laboratory scripts without re-running 
  the estimation.
  
- Plotting:
  1. Open-loop step responses for both motors.
  2. Visual representation of the Tangent Method, highlighting key time 
     instants and the tangent line construction.

DEPENDENCIES & SETUP
--------------------
- Helper Functions: All custom functions used by this script are located 
  in the 'extra_functions' subfolder.
- Pre-requisites: Please read the "% NOTE" section inside the script
  before execution to ensure the correct data file is selected and all the
  necessary parameters are set adequately.