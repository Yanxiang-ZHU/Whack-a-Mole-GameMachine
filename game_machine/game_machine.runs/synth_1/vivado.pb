
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:062

00:00:162	
492.8092	
181.781Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/utils_1/imports/synth_1/GameTop.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2y
wC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/utils_1/imports/synth_1/GameTop.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
c
Command: %s
53*	vivadotcl22
0synth_design -top GameTop -part xc7a200tfbg484-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
{
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2

xc7a200tZ17-347h px� 
k
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2

xc7a200tZ17-349h px� 
E
Loading part %s157*device2
xc7a200tfbg484-1Z21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
29540Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:12 ; elapsed = 00:00:23 . Memory (MB): peak = 1411.922 ; gain = 440.598
h px� 
�
synthesizing module '%s'%s4497*oasys2	
GameTop2
 2o
kC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/GameTop.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

KeyPress2
 2p
lC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/KeyPress.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

KeyPress2
 2
02
12p
lC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/KeyPress.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
	RandomGen2
 2q
mC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/RandomGen.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	RandomGen2
 2
02
12q
mC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/RandomGen.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
GameControl2
 2s
oC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/GameControl.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
GameControl2
 2
02
12s
oC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/GameControl.v2
38@Z8-6155h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322

max_time2
482
GameControl2o
kC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/GameTop.v2
878@Z8-689h px� 
�
synthesizing module '%s'%s4497*oasys2	
Effects2
 2o
kC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/Effects.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
Effects2
 2
02
12o
kC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/Effects.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ScoreDisplay2
 2t
pC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/ScoreDisplay.v2
38@Z8-6157h px� 
�
-case statement is not full and has no default155*oasys2t
pC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/ScoreDisplay.v2
668@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ScoreDisplay2
 2
02
12t
pC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/ScoreDisplay.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
SoundPlayer2
 2s
oC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/SoundPlayer.v2
38@Z8-6157h px� 
�
default block is never used226*oasys2s
oC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/SoundPlayer.v2
678@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
SoundPlayer2
 2
02
12s
oC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/SoundPlayer.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
TextLCD2
 2o
kC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/TextLCD.v2
18@Z8-6157h px� 
�
-case statement is not full and has no default155*oasys2o
kC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/TextLCD.v2
1548@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2o
kC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/TextLCD.v2
1018@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
TextLCD2
 2
02
12o
kC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/TextLCD.v2
18@Z8-6155h px� 
�
Fall outputs are unconnected for this instance and logic may be removed3605*oasys2o
kC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/GameTop.v2
1348@Z8-4446h px� 
�
synthesizing module '%s'%s4497*oasys2
ila_02
 2�
�C:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.runs/synth_1/.Xil/Vivado-43084-YanX/realtime/ila_0_stub.v2
68@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ila_02
 2
02
12�
�C:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.runs/synth_1/.Xil/Vivado-43084-YanX/realtime/ila_0_stub.v2
68@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
GameTop2
 2
02
12o
kC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/GameTop.v2
38@Z8-6155h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
sequence_reg[0]2
SoundPlayer2s
oC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/SoundPlayer.v2
1048@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
sequence_reg[1]2
SoundPlayer2s
oC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/SoundPlayer.v2
1048@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
sequence_reg[2]2
SoundPlayer2s
oC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/SoundPlayer.v2
1048@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
seq_length_reg2
SoundPlayer2s
oC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/SoundPlayer.v2
1078@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
score_bcd_reg[2]2	
TextLCD2o
kC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/TextLCD.v2
638@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
score_bcd_reg[1]2	
TextLCD2o
kC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/TextLCD.v2
638@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
score_bcd_reg[0]2	
TextLCD2o
kC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/TextLCD.v2
638@Z8-7137h px� 
�
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2
ila_0_inst02o
kC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/GameTop.v2
1348@Z8-6071h px� 
�
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2

KeyPress_u2o
kC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/GameTop.v2
378@Z8-6071h px� 
�
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2
game_control2o
kC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/GameTop.v2
798@Z8-6071h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:15 ; elapsed = 00:00:31 . Memory (MB): peak = 1530.992 ; gain = 559.668
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:15 ; elapsed = 00:00:31 . Memory (MB): peak = 1530.992 ; gain = 559.668
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:15 ; elapsed = 00:00:31 . Memory (MB): peak = 1530.992 ; gain = 559.668
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0522

1530.9922
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.gen/sources_1/ip/ila_0/ila_0/ila_0_in_context.xdc2
ila_0_inst0	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.gen/sources_1/ip/ila_0/ila_0/ila_0_in_context.xdc2
ila_0_inst0	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2u
qC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/constrs_1/new/constraints.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2u
qC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/constrs_1/new/constraints.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2s
qC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/constrs_1/new/constraints.xdc2
.Xil/GameTop_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0032

1618.2232
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0992

1618.2232
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:27 ; elapsed = 00:01:01 . Memory (MB): peak = 1618.223 ; gain = 646.898
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Loading part: xc7a200tfbg484-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:27 ; elapsed = 00:01:01 . Memory (MB): peak = 1618.223 ; gain = 646.898
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:27 ; elapsed = 00:01:01 . Memory (MB): peak = 1618.223 ; gain = 646.898
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
t
3inferred FSM for state register '%s' in module '%s'802*oasys2
game_state_reg2
GameControlZ8-802h px� 
r
3inferred FSM for state register '%s' in module '%s'802*oasys2
enable_phase_reg2	
TextLCDZ8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    IDLE |                               00 |                               00
h p
x
� 
y
%s
*synth2a
_                    PLAY |                               01 |                               01
h p
x
� 
y
%s
*synth2a
_                    GEND |                               10 |                               10
h p
x
� 
y
%s
*synth2a
_                   PAUSE |                               11 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
game_state_reg2

sequential2
GameControlZ8-3354h px� 
�
!inferring latch for variable '%s'327*oasys2
seg_led_temp_reg2t
pC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.srcs/sources_1/new/ScoreDisplay.v2
678@Z8-327h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                  iSTATE |                              001 |                               00
h p
x
� 
y
%s
*synth2a
_                 iSTATE0 |                              010 |                               01
h p
x
� 
y
%s
*synth2a
_                 iSTATE1 |                              100 |                               10
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
enable_phase_reg2	
one-hot2	
TextLCDZ8-3354h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:28 ; elapsed = 00:01:05 . Memory (MB): peak = 1618.223 ; gain = 646.898
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   48 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   25 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   13 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    6 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit       Adders := 5     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit       Adders := 1     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   4 Input      1 Bit         XORs := 1     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               48 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               16 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 38    
h p
x
� 
H
%s
*synth20
.	                7 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                6 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                5 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 4     
h p
x
� 
H
%s
*synth20
.	                2 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 12    
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   48 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input   48 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input   28 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   25 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   13 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   8 Input   11 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  10 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   8 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    6 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  10 Input    5 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  17 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  10 Input    4 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input    3 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   5 Input    3 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   3 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 8     
h p
x
� 
F
%s
*synth2.
,	   3 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  11 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 31    
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 15    
h p
x
� 
F
%s
*synth2.
,	   7 Input    1 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  10 Input    1 Bit        Muxes := 9     
h p
x
� 
F
%s
*synth2.
,	   3 Input    1 Bit        Muxes := 3     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
s
%s
*synth2[
YPart Resources:
DSPs: 740 (col length:100)
BRAMs: 730 (col length: RAMB18 100 RAMB36 50)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
{
9Port %s in module %s is either unconnected or has no load4866*oasys2
random_num[7]2
GameControlZ8-7129h px� 
{
9Port %s in module %s is either unconnected or has no load4866*oasys2
random_num[6]2
GameControlZ8-7129h px� 
{
9Port %s in module %s is either unconnected or has no load4866*oasys2
random_num[5]2
GameControlZ8-7129h px� 
{
9Port %s in module %s is either unconnected or has no load4866*oasys2
random_num[4]2
GameControlZ8-7129h px� 
{
9Port %s in module %s is either unconnected or has no load4866*oasys2
random_num[3]2
GameControlZ8-7129h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:36 ; elapsed = 00:01:21 . Memory (MB): peak = 1618.223 ; gain = 646.898
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:41 ; elapsed = 00:01:33 . Memory (MB): peak = 1618.223 ; gain = 646.898
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:43 ; elapsed = 00:01:38 . Memory (MB): peak = 1618.223 ; gain = 646.898
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:44 ; elapsed = 00:01:39 . Memory (MB): peak = 1618.223 ; gain = 646.898
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:49 ; elapsed = 00:01:50 . Memory (MB): peak = 1618.223 ; gain = 646.898
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:49 ; elapsed = 00:01:50 . Memory (MB): peak = 1618.223 ; gain = 646.898
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:49 ; elapsed = 00:01:50 . Memory (MB): peak = 1618.223 ; gain = 646.898
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:49 ; elapsed = 00:01:50 . Memory (MB): peak = 1618.223 ; gain = 646.898
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:49 ; elapsed = 00:01:50 . Memory (MB): peak = 1618.223 ; gain = 646.898
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:49 ; elapsed = 00:01:50 . Memory (MB): peak = 1618.223 ; gain = 646.898
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|      |BlackBox name |Instances |
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|1     |ila_0         |         1|
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|      |Cell   |Count |
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|1     |ila    |     1|
h px� 
2
%s*synth2
|2     |BUFG   |     1|
h px� 
2
%s*synth2
|3     |CARRY4 |   262|
h px� 
2
%s*synth2
|4     |LUT1   |    14|
h px� 
2
%s*synth2
|5     |LUT2   |   373|
h px� 
2
%s*synth2
|6     |LUT3   |   379|
h px� 
2
%s*synth2
|7     |LUT4   |   239|
h px� 
2
%s*synth2
|8     |LUT5   |    56|
h px� 
2
%s*synth2
|9     |LUT6   |   145|
h px� 
2
%s*synth2
|10    |FDCE   |   378|
h px� 
2
%s*synth2
|11    |FDPE   |    25|
h px� 
2
%s*synth2
|12    |FDRE   |    18|
h px� 
2
%s*synth2
|13    |LD     |     4|
h px� 
2
%s*synth2
|14    |IBUF   |     7|
h px� 
2
%s*synth2
|15    |OBUF   |    38|
h px� 
2
%s*synth2
+------+-------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:49 ; elapsed = 00:01:50 . Memory (MB): peak = 1618.223 ; gain = 646.898
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 7 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:28 ; elapsed = 00:01:35 . Memory (MB): peak = 1618.223 ; gain = 559.668
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:49 ; elapsed = 00:01:51 . Memory (MB): peak = 1618.223 ; gain = 646.898
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0342

1618.2232
0.000Z17-268h px� 
U
-Analyzing %s Unisim elements for replacement
17*netlist2
266Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1618.2232
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2G
E  A total of 4 instances were transformed.
  LD => LDCE: 4 instances
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

f1f18fedZ4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
502
162
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:562

00:02:202

1618.2232

1085.863Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0332

1618.2232
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2i
gC:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.runs/synth_1/GameTop.dcpZ17-1381h px� 
�
%s4*runtcl2f
dExecuting : report_utilization -file GameTop_utilization_synth.rpt -pb GameTop_utilization_synth.pb
h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Mon May 12 01:09:19 2025Z17-206h px� 


End Record