# Audio Controller Project for DE1-SoC Board

# Overview
This project uses the DE1-SoC board to control audio volume, change screen colors, and switch audio tones. The KEYs and switches on the board are used to interact with these features.

Main Features
- Volume Control: Adjust the audio volume using the board’s buttons.
- Display duration of tone on HEX
- Screen Color Change: Change the screen’s color using the switches.
- Tone Switching: Select different audio tones by using the switches.

# Hardware Setup

Required:
- DE1-SoC Board  
- Headphones or speakers  
- Monitor (for screen color changes)

Inputs:
- KEY0–KEY3: For volume and tone control  
- SW0–SW3: For tone selection and screen color changes  

---

# How to Use
1. Power on the DE1-SoC board.
2. Use the buttons and switches to control:
   - KEY0: Increase the volume  
   - KEY1: Decrease the volume  
   - SW0–SW3: Change the screen color  
3. Listen to the sound output and watch the screen change.

# How to Set Up
1. Open the project in Quartus.
2. Set up the required pin assignments and compile the project.
3. Upload it to the DE1-SoC board and test its functionality.
