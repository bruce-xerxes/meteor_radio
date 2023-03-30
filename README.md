# meteor_radio
Detection of meteors via radio - this is an audio bandpass filter implemented in a TI C2000 device
Radio meteor detection is a project for Central Washington University's Astronomy Club and students.
The equipment comprises a custom antenna which feeds a software defined radio, which in turn is tuned 
to slightly off of the carrier of a distant digital television station (DTV). The software defined radio
operates in lower sideband mode so that when the DTV carrier is present, a 1KHz audio tone is produced.
This audio signal then is fed into one of the ADC inputs of the 320F28069 microcontroller, which is 
what this code is for. The microcontroller continuously samples the ADC at 8 KHZ via a timer loop. In
the timer loop it implements a bandpass IIR, using a double buffer scheme. The contents of these buffers
are then averaged at a lower rate and when the average exceeds a threshold, the serial port is used to
print out a character encoding the strength of the signal as a single hex value. If no signal is present,
the period character is output every five seconds. When a signal is present, a character is output every
10 ms.
The code is an obvious hack of the Example_2086Sci_echoback demo code and the ADC code from TI's demo
library. It is built under CCS version 12.2.

One problem with this approach is that the oscillators need to be very stable. A better approach is a 
filterbank or simply running the FFT and making say 10Hz bins and then looking for a consistent
signal within a bin. 
