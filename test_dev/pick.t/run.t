CLI errors.

  $ bm pick
  bm: required arguments IN_BTAB, OUT_BTAB, ID_FILE are missing
  Usage: bm pick [OPTION]… IN_BTAB OUT_BTAB ID_FILE
  Try 'bm pick --help' or 'bm --help' for more information.
  [1]
  $ bm pick a
  bm: required arguments OUT_BTAB, ID_FILE are missing
  Usage: bm pick [OPTION]… IN_BTAB OUT_BTAB ID_FILE
  Try 'bm pick --help' or 'bm --help' for more information.
  [1]
  $ bm pick a b
  bm: required argument ID_FILE is missing
  Usage: bm pick [OPTION]… IN_BTAB OUT_BTAB ID_FILE
  Try 'bm pick --help' or 'bm --help' for more information.
  [1]
  $ bm pick a b c 
  bm: IN_BTAB argument: no 'a' file
  Usage: bm pick [OPTION]… IN_BTAB OUT_BTAB ID_FILE
  Try 'bm pick --help' or 'bm --help' for more information.
  [1]

Help

  $ bm pick --help
  BM-PICK(1)                         Bm Manual                        BM-PICK(1)
  
  
  
  NNAAMMEE
         bm-pick - Pick records with query and target both in given ID file
  
  SSYYNNOOPPSSIISS
         bbmm ppiicckk [_O_P_T_I_O_N]… _I_N___B_T_A_B _O_U_T___B_T_A_B _I_D___F_I_L_E
  
  AARRGGUUMMEENNTTSS
         _I_D___F_I_L_E (required)
             File with IDs to keep. One ID per line!
  
         _I_N___B_T_A_B (required)
             Input btab file
  
         _O_U_T___B_T_A_B (required)
             Output btab file. (Use /dev/stdout to write to stdout.)
  
  CCOOMMMMOONN OOPPTTIIOONNSS
         ----hheellpp[=_F_M_T] (default=aauuttoo)
             Show this help in format _F_M_T. The value _F_M_T must be one of aauuttoo,
             ppaaggeerr, ggrrooffff or ppllaaiinn. With aauuttoo, the format is ppaaggeerr or ppllaaiinn
             whenever the TTEERRMM env var is dduummbb or undefined.
  
         ----vveerrssiioonn
             Show version information.
  
  EEXXIITT SSTTAATTUUSS
         ppiicckk exits with the following status:
  
         0   on success.
  
         123 on indiscriminate errors reported on standard error.
  
         124 on command line parsing errors.
  
         125 on unexpected internal errors (bugs).
  
  SSEEEE AALLSSOO
         bm(1)
  
  
  
  Bm 1.0.0                                                            BM-PICK(1)
