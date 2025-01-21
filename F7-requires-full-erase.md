# F7 Requires Full Erase

## OpenBLT approach

Good news from 2025: use OpenBLT programming option

![image](https://github.com/user-attachments/assets/07d4343d-7f00-4b61-8ed0-5ff59db961f1)

While most rusEFI units support incremental firmware update while keeping settings intact we are facing unexplained issue with some F7 Proteus units. Those units require full erase prior to software update.

## Older approach before OpenBLT

Step 1: enter DFU
option a: in rusEFI console use "switch to DFU mode"
option b: open case, power ECU while holding "PROG" button to enter manual DFU

Step 2: full erase
in rusEFI console use "Full Erase Chip"

Step 3:
Manual DFU programming using rusEFI console as usual
