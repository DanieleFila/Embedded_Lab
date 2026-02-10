========================================================================
SECTION: YAW CONTROLLER SIMULATION (yaw_controller.slx)
========================================================================

DESCRIPTION
-----------
This project module simulates the operation of the Turtlebot equipped with a 
Yaw Controller. The simulation models the robot's dynamic behavior and the 
controller's response to a desired steering angle (which represents the 
angle calculated by the microcontroller based on the line position).

FILE STRUCTURE
--------------
- Main Model: 'yaw_controller.slx'
- Helper Scripts: Located in the 'simulink_functions' subfolder.

CONFIGURATION
-------------
Before running the simulation, ensure the Turtlebot's target linear velocity is 
set correctly (in the related model's constant block).

- Default Linear Velocity: 0.272 m/s 
  (This corresponds to a wheel angular velocity of ~ 8 rad/s).

HOW TO RUN THE SIMULATION
-------------------------
The workflow is fully automated via Simulink Callbacks:

1. AUTOMATED SETUP
   Upon starting the simulation, a setup script automatically executes. 
   This initializes all necessary workspace variables, including:
   - Controller gains
   - System constants
   - Physical parameters

2. INTERACTIVE CONTROL (Real-Time)
   Use the interactive slider during the simulation to adjust the desired 
   steering angle input.
   - Range: From -PI/2 to +PI/2 [rad]

3. VISUALIZATION
   The scopes display:
   - Real-time behavior of Left and Right wheels.
   - The Output Yaw Angle (transient response from 0 to target).

4. POST-PROCESSING & PLOTTING
   Once the simulation is stopped, a plotting script automatically runs. 
   This generates high-quality plots of the results, ready for inspection, 
   saving, and importing into reports.




========================================================================
SECTION: REAL TRACK DATA ANALYSIS (track_plot.m)
========================================================================

DESCRIPTION
-----------
The script 'track_plot.m' is designed to visualize real-world data acquired 
from the Turtlebot during track runs. It automatically loads the .mat files 
located in the 'data' subfolder and plots:
- Wheel speeds (Left and Right)
- Line sensor readings (Raw values detected during the path)

DEPENDENCIES & SETUP
--------------------
- Helper Functions: All auxiliary functions are located in the
  'extra_functions' subfolder.
- Pre-requisites: Please read the "% NOTE" sections inside the 'track_plot.m' 
  script before execution to understand specific configurations.

NOTE ON DATA FILES
------------------
The script processes specific acquisition files. Below is the legend describing 
the track shape, direction, and motor control mode for each file:

- 'track_acq_01_FC.mat' --> Clepsydra shaped track, clockwise,
                            Forward & Coast mode
- 'track_acq_02_FB.mat' --> Clepsydra shaped track, clockwise,
                            Forward & Brake mode
- 'track_acq_03_FC.mat' --> [BEST RESULT] Clepsydra shaped track, clockwise,
                            Forward & Coast mode
- 'track_acq_04_FC.mat' --> [BEST RESULT] Bullet shaped track, clockwise, 
                            Forward & Coast mode