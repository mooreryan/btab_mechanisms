CLI errors.

  $ bm 
  bm: required COMMAND name is missing, must be either 'pick' or 'top_hit'.
  Usage: bm COMMAND …
  Try 'bm --help' for more information.
  [1]
  $ bm apple
  bm: unknown command 'apple', must be either 'pick' or 'top_hit'.
  Usage: bm COMMAND …
  Try 'bm --help' for more information.
  [1]
  $ bm top_hit
  bm: required arguments IN_BTAB, OUT_BTAB are missing
  Usage: bm top_hit [--best-method=BEST_METHOD] [--compare-column=COMPARE_COLUMN] [OPTION]… IN_BTAB OUT_BTAB
  Try 'bm top_hit --help' or 'bm --help' for more information.
  [1]
  $ bm top_hit apple
  bm: required argument OUT_BTAB is missing
  Usage: bm top_hit [--best-method=BEST_METHOD] [--compare-column=COMPARE_COLUMN] [OPTION]… IN_BTAB OUT_BTAB
  Try 'bm top_hit --help' or 'bm --help' for more information.
  [1]
  $ bm top_hit apple pie
  bm: IN_BTAB argument: no 'apple' file
  Usage: bm top_hit [--best-method=BEST_METHOD] [--compare-column=COMPARE_COLUMN] [OPTION]… IN_BTAB OUT_BTAB
  Try 'bm top_hit --help' or 'bm --help' for more information.
  [1]
  $ bm top_hit bad.tsv pie
  LOG -- Reading records
  ERROR -- ("get_top_hits failed" ("Caught exception" (Failure "Bad input")))
  [1]
  $ bm top_hit bad.tsv pie --best-method=apple 
  bm: option '--best-method': invalid value 'apple', expected overall or pair
  Usage: bm top_hit [--best-method=BEST_METHOD] [--compare-column=COMPARE_COLUMN] [OPTION]… IN_BTAB OUT_BTAB
  Try 'bm top_hit --help' or 'bm --help' for more information.
  [1]
  $ bm top_hit bad.tsv pie --compare-column=apple 
  bm: option '--compare-column': invalid value 'apple', expected bits, evalue,
      or pident
  Usage: bm top_hit [--best-method=BEST_METHOD] [--compare-column=COMPARE_COLUMN] [OPTION]… IN_BTAB OUT_BTAB
  Try 'bm top_hit --help' or 'bm --help' for more information.
  [1]

Help screen

  $ bm top_hit --help
  BM-TOP_HIT(1)                      Bm Manual                     BM-TOP_HIT(1)
  
  
  
  NNAAMMEE
         bm-top_hit - Pick best hits from a btab file
  
  SSYYNNOOPPSSIISS
         bbmm ttoopp__hhiitt [----bbeesstt--mmeetthhoodd=_B_E_S_T___M_E_T_H_O_D]
         [----ccoommppaarree--ccoolluummnn=_C_O_M_P_A_R_E___C_O_L_U_M_N] [_O_P_T_I_O_N]… _I_N___B_T_A_B _O_U_T___B_T_A_B
  
  AARRGGUUMMEENNTTSS
         _I_N___B_T_A_B (required)
             Input btab file
  
         _O_U_T___B_T_A_B (required)
             Output btab file. (Use /dev/stdout to write to stdout.)
  
  OOPPTTIIOONNSS
         --bb _B_E_S_T___M_E_T_H_O_D, ----bbeesstt--mmeetthhoodd=_B_E_S_T___M_E_T_H_O_D (absent=oovveerraallll)
             Do you want the single overall best hit for each query, or do you
             want the best hit among each unique query-target pair? (overall or
             pair)
  
         --cc _C_O_M_P_A_R_E___C_O_L_U_M_N, ----ccoommppaarree--ccoolluummnn=_C_O_M_P_A_R_E___C_O_L_U_M_N (absent=bbiittss)
             Do you want to use bit score, E-value, or percent identity to
             determine the best hit? (bits, evalue, pident)
  
  CCOOMMMMOONN OOPPTTIIOONNSS
         ----hheellpp[=_F_M_T] (default=aauuttoo)
             Show this help in format _F_M_T. The value _F_M_T must be one of aauuttoo,
             ppaaggeerr, ggrrooffff or ppllaaiinn. With aauuttoo, the format is ppaaggeerr or ppllaaiinn
             whenever the TTEERRMM env var is dduummbb or undefined.
  
         ----vveerrssiioonn
             Show version information.
  
  EEXXIITT SSTTAATTUUSS
         ttoopp__hhiitt exits with the following status:
  
         0   on success.
  
         123 on indiscriminate errors reported on standard error.
  
         124 on command line parsing errors.
  
         125 on unexpected internal errors (bugs).
  
  SSEEEE AALLSSOO
         bm(1)
  
  
  
  Bm 1.0.0                                                         BM-TOP_HIT(1)
