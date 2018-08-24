#$$eb
#$$sz 0		- Size opt info
#$$ss 0		- XO option
#$$sg 1		- Xoptimized-debug-off option and	- g option
#$$fp 0		- Floating point mode
#$$m2		- PowerPC mnemonics
#$$pVLE		- PowerPC VLE encoding
#$$oPPCE200Z4
#$$ko 1		- Reorder info
	.file		"LinIf_SetTrcvMode.c"
#$$dg 1
	.section	.PPC.EMB.apuinfo,,@note
	.4byte		8
	.4byte		8+4
	.4byte		2
	.byte		"APUinfo"
	.byte		0
	.align		2
	.4byte		0x01040001
	.4byte		0x00400001
	.4byte		0x01010001

	.section	.text_vle
	.section	.debug_line,,n
.L8:
	.section	.text_vle
#$$ld
.L4:
	.0byte		.L2
	.d2_line_start	.debug_line
	.section	.text_vle
# FUNC (Std_ReturnType, LINIF_CODE)LinIf_SetTrcvMode(NetworkHandleType Channel, LinTrcv_TrcvModeType TransceiverMode)
	.align		2
	.section	.text_vle
	.d2file		"d:\\VSB_Demo\\VSTAR_MPC5746R_Diab_PR_4.2.2_g_3.0_10\\VSTAR\\BSWs\\COM\\LinIf\\ssc\\make\\..\\src\\LinIf_SetTrcvMode.c"
        .d2line         52,34
#$$ld
.L284:

#$$bf	LinIf_SetTrcvMode,interprocedural,rasave,nostackparams
	.globl		LinIf_SetTrcvMode
	.d2_cfa_start __cie
LinIf_SetTrcvMode:
.Llo1:
	stwu		r1,-32(r1)		
	.d2_cfa_def_cfa_offset	32
	mfspr		r0,lr
	stw		r31,28(r1)		# offset r1+28  0x1c
	.d2_cfa_offset_list	31,31,1,1
	stw		r0,36(r1)
	.d2_cfa_offset    108,-1
	mr		r3,r3		# Channel=r3 Channel=r3
	mr		r31,r4		# TransceiverMode=r31 TransceiverMode=r4
	.d2prologue_end
# {
#      /* variable to hold the presence of development errors */
#      VAR (Std_ReturnType, AUTOMATIC) ReturnVal = E_NOT_OK;
	.d2line		55
	diab.li		r5,1		# ReturnVal=r5
# 
#      /* Pointer pointing to the current channel pointer */
#      P2CONST (LinIfChannel, AUTOMATIC, LINIF_APPL_DATA) crntChannel_p = NULL_PTR;
	.d2line		58
.Llo8:
	diab.li		r0,0
	stw		r0,8(r1)
# 
#     /* Check if the LINIF module is not initialized */
#     if (LINIF_UNINIT == LinIf_GlobalInitStsFlag)
	.d2line		61
	lis		r4,LinIf_GlobalInitStsFlag@ha
.Llo5:
	lbz		r0,LinIf_GlobalInitStsFlag@l(r4)
	se_cmpi		r0,0
	bc		1,2,.L280	# eq
#     {
# #if ( LINIF_DEV_ERROR_DETECT == STD_ON )
#         /* Report the LINIF_E_UNINIT error to DET module */
#         (void)Det_ReportError (LINIF_MODULE_ID,
#                         LINIF_INSTANCE_ID, LINIF_SETTRCVMODE_FUN_ID, LINIF_E_UNINIT); /*[LINIF535]*/
# #endif /* End of LINIF_DEV_ERROR_DETECT */
#     }
#     else
#     {
#         /* Search for the channel */
#         LinIf_FindChannel(Channel,&crntChannel_p);
	.d2line		72
.Llo6:
	rlwinm		r3,r3,0,24,31		# Channel=r3 Channel=r3
.Llo2:
	diab.addi		r4,r1,8
	bl		LinIf_FindChannel
# #if ( LINIF_DEV_ERROR_DETECT == STD_ON )
# 
#         /* Check if the channel is out of range */
#         if (NULL_PTR == crntChannel_p)
#         {
#             /* Report to DET */
#             (void)Det_ReportError (LINIF_MODULE_ID,
#                             LINIF_INSTANCE_ID, LINIF_SETTRCVMODE_FUN_ID,
#                             LINIF_E_TRCV_INV_CHANNEL); /*[LINIF539]*/
#         }
#         /* check if no Trcv instance available */
#         else if (NULL_PTR==crntChannel_p->LinTrcvDrvCalls_p)
#         {
#             /* Keep E_NOT_OK */
#         }
#         else
#         {
#             /* Check if Trcv mode is valid */
#             if ( (LINTRCV_TRCV_MODE_NORMAL == TransceiverMode)  ||
#                  (LINTRCV_TRCV_MODE_STANDBY == TransceiverMode) ||
#                   (LINTRCV_TRCV_MODE_SLEEP == TransceiverMode)    )
#             {
#                  VAR (LinTrcv_TrcvModeType, AUTOMATIC) currentTransceiverMode;
# 
#                 /* Call LinTrcv_GetOpMode_p to get the current Trcv Mode */
#                 ReturnVal = crntChannel_p->LinTrcvDrvCalls_p->LinTrcv_GetOpMode_p(
#                         LinIf_ChannelIdentifier_p[crntChannel_p->LinIfChannelIndex].LinIfTrcvIdRef,&currentTransceiverMode);/*[LINIF534]*/
# 
# 
#                 if (E_OK != ReturnVal)
#                 {
#                     if ( ( LINTRCV_TRCV_MODE_SLEEP  == TransceiverMode) &&
#                          ( LINTRCV_TRCV_MODE_NORMAL != currentTransceiverMode ))
#                     {
#                         /* Report to DET */
#                         (void)Det_ReportError (LINIF_MODULE_ID,
#                                     LINIF_INSTANCE_ID, LINIF_SETTRCVMODE_FUN_ID,
#                                     LINIF_E_TRCV_NOT_NORMAL); /*[LINIF568]*/
#                         /* Set the return value */
#                         ReturnVal = E_NOT_OK;
#                     }
#                 }
# 
#             }
#             else
#             {
#                 /* Report to DET */
#                 (void)Det_ReportError (LINIF_MODULE_ID,
#                                 LINIF_INSTANCE_ID, LINIF_SETTRCVMODE_FUN_ID,
#                                 LINIF_E_TRCV_INV_MODE); /*[LINIF540]*/
#             }
#         }
# 
#         if (E_OK == ReturnVal)
# #endif /* End of LINIF_DEV_ERROR_DETECT  */
#         {
#             /* Call LinTrcv_SetOpMode */
#             ReturnVal = crntChannel_p->LinTrcvDrvCalls_p->LinTrcv_SetOpMode_p(LinIf_ChannelIdentifier_p
	.d2line		130
	lwz		r4,8(r1)
	lwz		r3,0(r4)		# Channel=r3
.Llo3:
	lwz		r0,0(r3)		# Channel=r3
	mtspr		ctr,r0
	lis		r3,LinIf_ChannelIdentifier_p@ha		# Channel=r3
	lwz		r3,LinIf_ChannelIdentifier_p@l(r3)		# Channel=r3 Channel=r3
	lbz		r0,12(r4)
	e_mulli		r0,r0,3
	lbzx		r3,r3,r0		# Channel=r3 Channel=r3
.Llo4:
	mr		r4,r31		# TransceiverMode=r4 TransceiverMode=r31
#$$fn 0x1ff9 0x0 0x0 0x1
#$$tl 0x18 0x0 0x0 0x1
#$$rs 1 u
	bcctrl		20,0
.Llo7:
	mr		r5,r3		# ReturnVal=r5 ReturnVal=r3
.L280:
#                         [crntChannel_p->LinIfChannelIndex].LinIfTrcvIdRef,TransceiverMode); /*[LINIF536]*/ /*[LINIF537]*/ /*[LINIF538]*/
#         }
#     } /* [SWS_LinIf_00535] */
#     return ReturnVal;
	.d2line		134
.Llo9:
	rlwinm		r3,r5,0,24,31		# Channel=r3 ReturnVal=r5
# } /* End of LinIf_SetTrcvMode() */
	.d2line		135
	.d2epilogue_begin
.Llo10:
	lwz		r31,28(r1)		# offset r1+28  0x1c
	.d2_cfa_restore_list	3,10
	lwz		r0,36(r1)
	mtspr		lr,r0
	se_addi		r1,32		
	.d2_cfa_def_cfa_offset	0
	blr
.Llo11:
#$$ef
	.d2_cfa_end 2
	.section	.text_vle
#$$ld
.L285:
	.type		LinIf_SetTrcvMode,@function
	.size		LinIf_SetTrcvMode,.-LinIf_SetTrcvMode
# Number of nodes = 41

# Allocations for LinIf_SetTrcvMode
#	?a4		Channel
#	?a5		TransceiverMode
#	?a6		ReturnVal
#	SP,8		crntChannel_p

# Allocations for module
	.section	.text_vle
	.0byte		.L306
	.section	.text_vle
#$$ld
.L5:
.L429:	.d2filenum "..\\..\\BuildSystem\\..\\TTs\\AUTOSAR\\ar422\\Lin_GeneralTypes.h"
.L312:	.d2filenum "d:\\VSB_Demo\\VSTAR_MPC5746R_Diab_PR_4.2.2_g_3.0_10\\VSTAR\\BSWs\\COM\\LinIf\\ssc\\make\\..\\inc\\LinIf_Types.h"
.L304:	.d2filenum "d:\\VSB_Demo\\VSTAR_MPC5746R_Diab_PR_4.2.2_g_3.0_10\\VSTAR\\BSWs\\COM\\LinIf\\ssc\\make\\..\\inc\\LinIf_Private.h"
.L286:	.d2filenum "d:\\VSB_Demo\\VSTAR_MPC5746R_Diab_PR_4.2.2_g_3.0_10\\VSTAR\\BSWs\\COM\\LinIf\\ssc\\make\\..\\src\\LinIf_SetTrcvMode.c"
	.d2_line_end


	.section	.debug_abbrev,,n
.L9:
	.section	.debug_abbrev,,n
	.uleb128	1
	.uleb128	17
	.byte		0x1
	.uleb128	1
	.uleb128	19
	.uleb128	3
	.uleb128	8
	.uleb128	37
	.uleb128	8
	.uleb128	27
	.uleb128	8
	.uleb128	19
	.uleb128	15
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	16
	.uleb128	6
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.uleb128	2
	.uleb128	46
	.byte		0x1
	.uleb128	1
	.uleb128	19
	.uleb128	3
	.uleb128	8
	.uleb128	58
	.uleb128	6
	.uleb128	59
	.uleb128	15
	.uleb128	57
	.uleb128	15
	.uleb128	73
	.uleb128	16
	.uleb128	63
	.uleb128	12
	.uleb128	39
	.uleb128	12
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.uleb128	3
	.uleb128	5
	.byte		0x0
	.uleb128	58
	.uleb128	6
	.uleb128	59
	.uleb128	15
	.uleb128	57
	.uleb128	15
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	16
	.uleb128	2
	.uleb128	6
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.uleb128	4
	.uleb128	52
	.byte		0x0
	.uleb128	58
	.uleb128	6
	.uleb128	59
	.uleb128	15
	.uleb128	57
	.uleb128	15
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	16
	.uleb128	2
	.uleb128	6
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.uleb128	5
	.uleb128	52
	.byte		0x0
	.uleb128	58
	.uleb128	6
	.uleb128	59
	.uleb128	15
	.uleb128	57
	.uleb128	15
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	16
	.uleb128	2
	.uleb128	9
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.uleb128	6
	.uleb128	52
	.byte		0x0
	.uleb128	63
	.uleb128	12
	.uleb128	60
	.uleb128	12
	.uleb128	58
	.uleb128	6
	.uleb128	59
	.uleb128	15
	.uleb128	57
	.uleb128	15
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	16
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.uleb128	7
	.uleb128	19
	.byte		0x1
	.uleb128	58
	.uleb128	6
	.uleb128	59
	.uleb128	15
	.uleb128	57
	.uleb128	15
	.uleb128	1
	.uleb128	19
	.uleb128	11
	.uleb128	15
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.uleb128	8
	.uleb128	13
	.byte		0x0
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	16
	.uleb128	56
	.uleb128	9
	.uleb128	50
	.uleb128	11
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.uleb128	9
	.uleb128	4
	.byte		0x1
	.uleb128	58
	.uleb128	6
	.uleb128	59
	.uleb128	15
	.uleb128	57
	.uleb128	15
	.uleb128	1
	.uleb128	19
	.uleb128	11
	.uleb128	15
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.uleb128	10
	.uleb128	40
	.byte		0x0
	.uleb128	3
	.uleb128	8
	.uleb128	28
	.uleb128	13
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.uleb128	11
	.uleb128	36
	.byte		0x0
	.uleb128	3
	.uleb128	8
	.uleb128	62
	.uleb128	11
	.uleb128	11
	.uleb128	11
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.uleb128	12
	.uleb128	22
	.byte		0x0
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	16
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.uleb128	13
	.uleb128	38
	.byte		0x0
	.uleb128	73
	.uleb128	16
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.uleb128	14
	.uleb128	15
	.byte		0x0
	.uleb128	73
	.uleb128	16
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.uleb128	15
	.uleb128	1
	.byte		0x1
	.uleb128	1
	.uleb128	19
	.uleb128	73
	.uleb128	16
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.uleb128	16
	.uleb128	33
	.byte		0x0
	.uleb128	47
	.uleb128	15
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.uleb128	17
	.uleb128	21
	.byte		0x1
	.uleb128	1
	.uleb128	19
	.uleb128	73
	.uleb128	16
	.uleb128	39
	.uleb128	12
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.uleb128	18
	.uleb128	5
	.byte		0x0
	.uleb128	73
	.uleb128	16
	.uleb128	0
	.uleb128	0
	.section	.debug_abbrev,,n
	.sleb128	0


	.section	.debug_info,,n
.L2:
	.4byte		.L3-.L1
.L1:
	.2byte		0x2
	.4byte		.L9
	.byte		0x4
	.section	.debug_info,,n
	.sleb128	1
	.4byte		.L7-.L2
	.byte		"d:\\VSB_Demo\\VSTAR_MPC5746R_Diab_PR_4.2.2_g_3.0_10\\VSTAR\\BSWs\\COM\\LinIf\\ssc\\make\\..\\src\\LinIf_SetTrcvMode.c"
	.byte		0
	.byte		"Diab Data, Inc:dcc Rel 5.9.6.4:PPCE200Z4204N3V"
	.byte		0
	.byte		"D:\\VSB_Demo\\VSTAR_MPC5746R_Diab_PR_4.2.2_g_3.0_10\\VSTAR\\Application\\MetaWares"
	.byte		0
	.uleb128	12
	.4byte		.L4
	.4byte		.L5
	.4byte		.L8
	.section	.debug_info,,n
.L290:
	.sleb128	2
	.4byte		.L283-.L2
	.byte		"LinIf_SetTrcvMode"
	.byte		0
	.4byte		.L286
	.uleb128	52
	.uleb128	34
	.4byte		.L287
	.byte		0x1
	.byte		0x1
	.4byte		.L284
	.4byte		.L285
	.section	.debug_info,,n
	.sleb128	3
	.4byte		.L286
	.uleb128	52
	.uleb128	34
	.byte		"Channel"
	.byte		0
	.4byte		.L291
	.4byte		.L292
	.sleb128	3
	.4byte		.L286
	.uleb128	52
	.uleb128	34
	.byte		"TransceiverMode"
	.byte		0
	.4byte		.L293
	.4byte		.L295
	.section	.debug_info,,n
.L296:
	.sleb128	4
	.4byte		.L286
	.uleb128	55
	.uleb128	38
	.byte		"ReturnVal"
	.byte		0
	.4byte		.L287
	.4byte		.L297
	.section	.debug_info,,n
.L298:
	.sleb128	5
	.4byte		.L286
	.uleb128	58
	.uleb128	57
	.byte		"crntChannel_p"
	.byte		0
	.4byte		.L299
	.sleb128	3
	.byte		0x92
	.uleb128	1
	.sleb128	8
	.section	.debug_info,,n
	.sleb128	0
.L283:
	.section	.debug_info,,n
.L303:
	.sleb128	6
	.byte		0x1
	.byte		0x1
	.4byte		.L304
	.uleb128	206
	.uleb128	33
	.byte		"LinIf_GlobalInitStsFlag"
	.byte		0
	.4byte		.L305
	.0byte		.L303
.L306:
	.sleb128	6
	.byte		0x1
	.byte		0x1
	.4byte		.L304
	.uleb128	238
	.uleb128	76
	.byte		"LinIf_ChannelIdentifier_p"
	.byte		0
	.4byte		.L307
	.section	.debug_info,,n
	.section	.debug_info,,n
.L311:
	.sleb128	7
	.4byte		.L312
	.uleb128	322
	.uleb128	1
	.4byte		.L313-.L2
	.uleb128	3
	.section	.debug_info,,n
.L249:
	.sleb128	8
	.byte		"LinIfTrcvIdRef"
	.byte		0
	.4byte		.L314
	.sleb128	2
	.byte		0x23
	.uleb128	0
	.byte		0x1
.L250:
	.sleb128	8
	.byte		"LinIfChannelId"
	.byte		0
	.4byte		.L315
	.sleb128	2
	.byte		0x23
	.uleb128	1
	.byte		0x1
.L251:
	.sleb128	8
	.byte		"LinIfChannelRef"
	.byte		0
	.4byte		.L314
	.sleb128	2
	.byte		0x23
	.uleb128	2
	.byte		0x1
	.sleb128	0
.L313:
.L302:
	.sleb128	7
	.4byte		.L312
	.uleb128	322
	.uleb128	1
	.4byte		.L316-.L2
	.uleb128	32
.L240:
	.sleb128	8
	.byte		"LinTrcvDrvCalls_p"
	.byte		0
	.4byte		.L317
	.sleb128	2
	.byte		0x23
	.uleb128	0
	.byte		0x1
.L241:
	.sleb128	8
	.byte		"WakeupSourceIdLin"
	.byte		0
	.4byte		.L321
	.sleb128	2
	.byte		0x23
	.uleb128	4
	.byte		0x1
.L242:
	.sleb128	8
	.byte		"WakeupSourceIdTrcv"
	.byte		0
	.4byte		.L321
	.sleb128	2
	.byte		0x23
	.uleb128	8
	.byte		0x1
.L243:
	.sleb128	8
	.byte		"LinIfChannelIndex"
	.byte		0
	.4byte		.L314
	.sleb128	2
	.byte		0x23
	.uleb128	12
	.byte		0x1
.L244:
	.sleb128	8
	.byte		"ExternalChannelIndex"
	.byte		0
	.4byte		.L315
	.sleb128	2
	.byte		0x23
	.uleb128	13
	.byte		0x1
.L245:
	.sleb128	8
	.byte		"LinIfDelayForSleep"
	.byte		0
	.4byte		.L321
	.sleb128	2
	.byte		0x23
	.uleb128	16
	.byte		0x1
.L246:
	.sleb128	8
	.byte		"LinIfStartupState"
	.byte		0
	.4byte		.L324
	.sleb128	2
	.byte		0x23
	.uleb128	20
	.byte		0x1
.L247:
	.sleb128	8
	.byte		"LinDrvCalls_p"
	.byte		0
	.4byte		.L327
	.sleb128	2
	.byte		0x23
	.uleb128	24
	.byte		0x1
.L248:
	.sleb128	8
	.byte		"LinIf_channelManager_p"
	.byte		0
	.4byte		.L331
	.sleb128	2
	.byte		0x23
	.uleb128	28
	.byte		0x1
	.sleb128	0
.L316:
.L334:
	.sleb128	7
	.4byte		.L312
	.uleb128	322
	.uleb128	1
	.4byte		.L335-.L2
	.uleb128	48
.L223:
	.sleb128	8
	.byte		"LinIf_NewScheduleTableType"
	.byte		0
	.4byte		.L336
	.sleb128	2
	.byte		0x23
	.uleb128	0
	.byte		0x1
.L224:
	.sleb128	8
	.byte		"LinIf_RunContSchTableIndexRequested"
	.byte		0
	.4byte		.L338
	.sleb128	2
	.byte		0x23
	.uleb128	4
	.byte		0x1
.L225:
	.sleb128	8
	.byte		"LinIf_RunOnceSchTableRequested"
	.byte		0
	.4byte		.L338
	.sleb128	2
	.byte		0x23
	.uleb128	5
	.byte		0x1
.L226:
	.sleb128	8
	.byte		"LinIf_EntryDelayCounter"
	.byte		0
	.4byte		.L339
	.sleb128	2
	.byte		0x23
	.uleb128	6
	.byte		0x1
.L227:
	.sleb128	8
	.byte		"LinIf_SleepDelayCounter"
	.byte		0
	.4byte		.L322
	.sleb128	2
	.byte		0x23
	.uleb128	8
	.byte		0x1
.L228:
	.sleb128	8
	.byte		"LinIf_ScheduleTableIndex"
	.byte		0
	.4byte		.L338
	.sleb128	2
	.byte		0x23
	.uleb128	12
	.byte		0x1
.L229:
	.sleb128	8
	.byte		"LinIf_ScheduleTableType"
	.byte		0
	.4byte		.L336
	.sleb128	2
	.byte		0x23
	.uleb128	16
	.byte		0x1
.L230:
	.sleb128	8
	.byte		"LinIf_BusStatus"
	.byte		0
	.4byte		.L341
	.sleb128	2
	.byte		0x23
	.uleb128	20
	.byte		0x1
.L231:
	.sleb128	8
	.byte		"LinIf_ChannelSubState"
	.byte		0
	.4byte		.L343
	.sleb128	2
	.byte		0x23
	.uleb128	40
	.byte		0x1
.L232:
	.sleb128	8
	.byte		"LinIf_ChannelState"
	.byte		0
	.4byte		.L325
	.sleb128	2
	.byte		0x23
	.uleb128	44
	.byte		0x1
	.sleb128	0
.L335:
.L342:
	.sleb128	7
	.4byte		.L312
	.uleb128	322
	.uleb128	1
	.4byte		.L345-.L2
	.uleb128	20
.L219:
	.sleb128	8
	.byte		"Lin_DriverGetStatusVal"
	.byte		0
	.4byte		.L346
	.sleb128	2
	.byte		0x23
	.uleb128	0
	.byte		0x1
.L220:
	.sleb128	8
	.byte		"LinIf_frameStatus"
	.byte		0
	.4byte		.L347
	.sleb128	2
	.byte		0x23
	.uleb128	4
	.byte		0x1
.L221:
	.sleb128	8
	.byte		"LinIf_frameEntry_p"
	.byte		0
	.4byte		.L349
	.sleb128	2
	.byte		0x23
	.uleb128	8
	.byte		0x1
.L222:
	.sleb128	8
	.byte		"LinIf_RxData"
	.byte		0
	.4byte		.L353
	.sleb128	2
	.byte		0x23
	.uleb128	12
	.byte		0x1
	.sleb128	0
.L345:
.L352:
	.sleb128	7
	.4byte		.L312
	.uleb128	322
	.uleb128	1
	.4byte		.L355-.L2
	.uleb128	8
.L210:
	.sleb128	8
	.byte		"LinIfDelay"
	.byte		0
	.4byte		.L356
	.sleb128	2
	.byte		0x23
	.uleb128	0
	.byte		0x1
.L211:
	.sleb128	8
	.byte		"LinIfCollisionResolvingRef"
	.byte		0
	.4byte		.L357
	.sleb128	2
	.byte		0x23
	.uleb128	2
	.byte		0x1
.L212:
	.sleb128	8
	.byte		"LinIfFrameRef"
	.byte		0
	.4byte		.L358
	.sleb128	2
	.byte		0x23
	.uleb128	4
	.byte		0x1
	.sleb128	0
.L355:
.L361:
	.sleb128	7
	.4byte		.L312
	.uleb128	322
	.uleb128	1
	.4byte		.L362-.L2
	.uleb128	32
.L196:
	.sleb128	8
	.byte		"LinIfChecksumType"
	.byte		0
	.4byte		.L363
	.sleb128	2
	.byte		0x23
	.uleb128	0
	.byte		0x1
.L197:
	.sleb128	8
	.byte		"LinIfFrameType"
	.byte		0
	.4byte		.L365
	.sleb128	2
	.byte		0x23
	.uleb128	4
	.byte		0x1
.L198:
	.sleb128	8
	.byte		"LinIfLength"
	.byte		0
	.4byte		.L368
	.sleb128	2
	.byte		0x23
	.uleb128	8
	.byte		0x1
.L199:
	.sleb128	8
	.byte		"LinIfPid"
	.byte		0
	.4byte		.L370
	.sleb128	2
	.byte		0x23
	.uleb128	9
	.byte		0x1
.L200:
	.sleb128	8
	.byte		"LinIfTxConfirmationId"
	.byte		0
	.4byte		.L372
	.sleb128	2
	.byte		0x23
	.uleb128	10
	.byte		0x1
.L201:
	.sleb128	8
	.byte		"LinIfPduDirection"
	.byte		0
	.4byte		.L374
	.sleb128	2
	.byte		0x23
	.uleb128	12
	.byte		0x1
.L202:
	.sleb128	8
	.byte		"LinIfFixedFrameSduData"
	.byte		0
	.4byte		.L376
	.sleb128	2
	.byte		0x23
	.uleb128	13
	.byte		0x1
.L203:
	.sleb128	8
	.byte		"LinIfRxTxTargetPduRef"
	.byte		0
	.4byte		.L372
	.sleb128	2
	.byte		0x23
	.uleb128	22
	.byte		0x1
.L204:
	.sleb128	8
	.byte		"LinIfSubsFrames_p"
	.byte		0
	.4byte		.L378
	.sleb128	2
	.byte		0x23
	.uleb128	24
	.byte		0x1
.L205:
	.sleb128	8
	.byte		"LinIfNoOfSubEntry"
	.byte		0
	.4byte		.L314
	.sleb128	2
	.byte		0x23
	.uleb128	28
	.byte		0x1
.L206:
	.sleb128	8
	.byte		"LinIfFunctionIndex"
	.byte		0
	.4byte		.L356
	.sleb128	2
	.byte		0x23
	.uleb128	30
	.byte		0x1
	.sleb128	0
.L362:
.L381:
	.sleb128	7
	.4byte		.L312
	.uleb128	322
	.uleb128	1
	.4byte		.L382-.L2
	.uleb128	2
.L194:
	.sleb128	8
	.byte		"LinIfSubFrameIndex"
	.byte		0
	.4byte		.L314
	.sleb128	2
	.byte		0x23
	.uleb128	0
	.byte		0x1
.L195:
	.sleb128	8
	.byte		"LinIfSubFramePriority"
	.byte		0
	.4byte		.L314
	.sleb128	2
	.byte		0x23
	.uleb128	1
	.byte		0x1
	.sleb128	0
.L382:
.L320:
	.sleb128	7
	.4byte		.L312
	.uleb128	232
	.uleb128	14
	.4byte		.L383-.L2
	.uleb128	20
.L183:
	.sleb128	8
	.byte		"LinTrcv_SetOpMode_p"
	.byte		0
	.4byte		.L384
	.sleb128	2
	.byte		0x23
	.uleb128	0
	.byte		0x1
.L184:
	.sleb128	8
	.byte		"LinTrcv_GetOpMode_p"
	.byte		0
	.4byte		.L387
	.sleb128	2
	.byte		0x23
	.uleb128	4
	.byte		0x1
.L185:
	.sleb128	8
	.byte		"LinTrcv_GetBusWuReason_p"
	.byte		0
	.4byte		.L391
	.sleb128	2
	.byte		0x23
	.uleb128	8
	.byte		0x1
.L186:
	.sleb128	8
	.byte		"LinTrcv_SetWakeupMode_p"
	.byte		0
	.4byte		.L397
	.sleb128	2
	.byte		0x23
	.uleb128	12
	.byte		0x1
.L187:
	.sleb128	8
	.byte		"LinTrcv_CheckWakeup_p"
	.byte		0
	.4byte		.L402
	.sleb128	2
	.byte		0x23
	.uleb128	16
	.byte		0x1
	.sleb128	0
.L383:
.L330:
	.sleb128	7
	.4byte		.L312
	.uleb128	184
	.uleb128	1
	.4byte		.L405-.L2
	.uleb128	24
.L177:
	.sleb128	8
	.byte		"Lin_SendFrame_p"
	.byte		0
	.4byte		.L406
	.sleb128	2
	.byte		0x23
	.uleb128	0
	.byte		0x1
.L178:
	.sleb128	8
	.byte		"Lin_GoToSleep_p"
	.byte		0
	.4byte		.L412
	.sleb128	2
	.byte		0x23
	.uleb128	4
	.byte		0x1
.L179:
	.sleb128	8
	.byte		"Lin_GoToSleepInternal_p"
	.byte		0
	.4byte		.L415
	.sleb128	2
	.byte		0x23
	.uleb128	8
	.byte		0x1
.L180:
	.sleb128	8
	.byte		"Lin_Wakeup_p"
	.byte		0
	.4byte		.L418
	.sleb128	2
	.byte		0x23
	.uleb128	12
	.byte		0x1
.L181:
	.sleb128	8
	.byte		"Lin_GetStatus_p"
	.byte		0
	.4byte		.L421
	.sleb128	2
	.byte		0x23
	.uleb128	16
	.byte		0x1
.L182:
	.sleb128	8
	.byte		"Lin_CheckWakeup_p"
	.byte		0
	.4byte		.L426
	.sleb128	2
	.byte		0x23
	.uleb128	20
	.byte		0x1
	.sleb128	0
.L405:
.L411:
	.sleb128	7
	.4byte		.L429
	.uleb128	59
	.uleb128	13
	.4byte		.L430-.L2
	.uleb128	8
.L92:
	.sleb128	8
	.byte		"Pid"
	.byte		0
	.4byte		.L371
	.sleb128	2
	.byte		0x23
	.uleb128	0
	.byte		0x1
.L93:
	.sleb128	8
	.byte		"Cs"
	.byte		0
	.4byte		.L364
	.sleb128	2
	.byte		0x23
	.uleb128	1
	.byte		0x1
.L94:
	.sleb128	8
	.byte		"Drc"
	.byte		0
	.4byte		.L375
	.sleb128	2
	.byte		0x23
	.uleb128	2
	.byte		0x1
.L95:
	.sleb128	8
	.byte		"Dl"
	.byte		0
	.4byte		.L369
	.sleb128	2
	.byte		0x23
	.uleb128	3
	.byte		0x1
.L96:
	.sleb128	8
	.byte		"SduPtr"
	.byte		0
	.4byte		.L425
	.sleb128	2
	.byte		0x23
	.uleb128	4
	.byte		0x1
	.sleb128	0
.L430:
	.section	.debug_info,,n
.L348:
	.sleb128	9
	.4byte		.L312
	.uleb128	184
	.uleb128	1
	.4byte		.L431-.L2
	.uleb128	4
	.section	.debug_info,,n
	.sleb128	10
	.byte		"LINIF_FRAME_IDLE"
	.byte		0
	.sleb128	0
	.sleb128	10
	.byte		"LINIF_FRAME_RX_ONGOING"
	.byte		0
	.sleb128	1
	.sleb128	10
	.byte		"LINIF_FRAME_TX_ONGOING"
	.byte		0
	.sleb128	2
	.sleb128	10
	.byte		"LINIF_FRAME_FINISHED"
	.byte		0
	.sleb128	3
	.sleb128	10
	.byte		"LINIF_FRAME_ERROR"
	.byte		0
	.sleb128	4
	.sleb128	0
.L431:
.L367:
	.sleb128	9
	.4byte		.L312
	.uleb128	110
	.uleb128	1
	.4byte		.L432-.L2
	.uleb128	4
	.sleb128	10
	.byte		"INVALID_STATE"
	.byte		0
	.sleb128	0
	.sleb128	10
	.byte		"FREE"
	.byte		0
	.sleb128	1
	.sleb128	10
	.byte		"ASSIGN"
	.byte		0
	.sleb128	2
	.sleb128	10
	.byte		"ASSIGN_FRAME_ID_RANGE"
	.byte		0
	.sleb128	3
	.sleb128	10
	.byte		"EVENT_TRIGGERED"
	.byte		0
	.sleb128	4
	.sleb128	10
	.byte		"SAVE_CONFIGURATION"
	.byte		0
	.sleb128	5
	.sleb128	10
	.byte		"SPORADIC"
	.byte		0
	.sleb128	6
	.sleb128	10
	.byte		"SRF"
	.byte		0
	.sleb128	7
	.sleb128	10
	.byte		"UNASSIGN"
	.byte		0
	.sleb128	8
	.sleb128	10
	.byte		"UNCONDITIONAL"
	.byte		0
	.sleb128	9
	.sleb128	0
.L432:
.L344:
	.sleb128	9
	.4byte		.L312
	.uleb128	87
	.uleb128	1
	.4byte		.L433-.L2
	.uleb128	4
	.sleb128	10
	.byte		"LINIF_CHANNEL_SUBSTATE_IDLE"
	.byte		0
	.sleb128	0
	.sleb128	10
	.byte		"LINIF_CHANNEL_SLEEP_REQUEST"
	.byte		0
	.sleb128	1
	.sleb128	10
	.byte		"LINIF_CHANNEL_SLEEP_PENDING"
	.byte		0
	.sleb128	2
	.sleb128	10
	.byte		"LINIF_CHANNEL_GOTO_SLEEP_INTERNAL"
	.byte		0
	.sleb128	3
	.sleb128	10
	.byte		"LINIF_CHANNEL_WAKEUP_CONFIRMATION_PENDING_TYPE_FALSE"
	.byte		0
	.sleb128	4
	.sleb128	10
	.byte		"LINIF_CHANNEL_WAKEUP_CONFIRMATION_PENDING_TYPE_TRUE"
	.byte		0
	.sleb128	5
	.sleb128	0
.L433:
.L326:
	.sleb128	9
	.4byte		.L312
	.uleb128	79
	.uleb128	1
	.4byte		.L434-.L2
	.uleb128	4
	.sleb128	10
	.byte		"LINIF_CHANNEL_UNINIT"
	.byte		0
	.sleb128	0
	.sleb128	10
	.byte		"LINIF_CHANNEL_OPERATIONAL"
	.byte		0
	.sleb128	1
	.sleb128	10
	.byte		"LINIF_CHANNEL_SLEEP"
	.byte		0
	.sleb128	2
	.sleb128	0
.L434:
.L337:
	.sleb128	9
	.4byte		.L312
	.uleb128	70
	.uleb128	1
	.4byte		.L435-.L2
	.uleb128	4
	.sleb128	10
	.byte		"NULL_SCHEDULE"
	.byte		0
	.sleb128	0
	.sleb128	10
	.byte		"ACTIVE_RUN_ONCE"
	.byte		0
	.sleb128	1
	.sleb128	10
	.byte		"ACTIVE_RUN_CONTINUOUS"
	.byte		0
	.sleb128	2
	.sleb128	10
	.byte		"ACTIVE_SCHEDULE_MANAGER_OFF"
	.byte		0
	.sleb128	3
	.sleb128	0
.L435:
.L294:
	.sleb128	9
	.4byte		.L429
	.uleb128	59
	.uleb128	13
	.4byte		.L436-.L2
	.uleb128	4
	.sleb128	10
	.byte		"LINTRCV_TRCV_MODE_NORMAL"
	.byte		0
	.sleb128	0
	.sleb128	10
	.byte		"LINTRCV_TRCV_MODE_STANDBY"
	.byte		0
	.sleb128	1
	.sleb128	10
	.byte		"LINTRCV_TRCV_MODE_SLEEP"
	.byte		0
	.sleb128	2
	.sleb128	0
.L436:
.L396:
	.sleb128	9
	.4byte		.L429
	.uleb128	49
	.uleb128	13
	.4byte		.L437-.L2
	.uleb128	4
	.sleb128	10
	.byte		"LINTRCV_WU_ERROR"
	.byte		0
	.sleb128	0
	.sleb128	10
	.byte		"LINTRCV_WU_NOT_SUPPORTED"
	.byte		0
	.sleb128	1
	.sleb128	10
	.byte		"LINTRCV_WU_BY_BUS"
	.byte		0
	.sleb128	2
	.sleb128	10
	.byte		"LINTRCV_WU_BY_PIN"
	.byte		0
	.sleb128	3
	.sleb128	10
	.byte		"LINTRCV_WU_INTERNALLY"
	.byte		0
	.sleb128	4
	.sleb128	10
	.byte		"LINTRCV_WU_RESET"
	.byte		0
	.sleb128	5
	.sleb128	10
	.byte		"LINTRCV_WU_POWER_ON"
	.byte		0
	.sleb128	6
	.sleb128	0
.L437:
.L401:
	.sleb128	9
	.4byte		.L429
	.uleb128	42
	.uleb128	13
	.4byte		.L438-.L2
	.uleb128	4
	.sleb128	10
	.byte		"LINTRCV_WUMODE_ENABLE"
	.byte		0
	.sleb128	0
	.sleb128	10
	.byte		"LINTRCV_WUMODE_DISABLE"
	.byte		0
	.sleb128	1
	.sleb128	10
	.byte		"LINTRCV_WUMODE_CLEAR"
	.byte		0
	.sleb128	2
	.sleb128	0
.L438:
	.section	.debug_info,,n
.L289:
	.sleb128	11
	.byte		"unsigned char"
	.byte		0
	.byte		0x8
	.byte		0x1
	.section	.debug_info,,n
.L288:
	.sleb128	12
	.byte		"uint8"
	.byte		0
	.4byte		.L289
.L287:
	.sleb128	12
	.byte		"Std_ReturnType"
	.byte		0
	.4byte		.L288
.L291:
	.sleb128	12
	.byte		"NetworkHandleType"
	.byte		0
	.4byte		.L288
.L293:
	.sleb128	12
	.byte		"LinTrcv_TrcvModeType"
	.byte		0
	.4byte		.L294
.L301:
	.sleb128	12
	.byte		"LinIfChannel"
	.byte		0
	.4byte		.L302
	.section	.debug_info,,n
.L300:
	.sleb128	13
	.4byte		.L301
	.section	.debug_info,,n
.L299:
	.sleb128	14
	.4byte		.L300
.L305:
	.sleb128	12
	.byte		"boolean"
	.byte		0
	.4byte		.L289
.L310:
	.sleb128	12
	.byte		"LinIfChannelIdentifier"
	.byte		0
	.4byte		.L311
.L309:
	.sleb128	13
	.4byte		.L310
.L308:
	.sleb128	14
	.4byte		.L309
.L307:
	.sleb128	13
	.4byte		.L308
.L314:
	.sleb128	13
	.4byte		.L288
.L315:
	.sleb128	13
	.4byte		.L291
.L319:
	.sleb128	12
	.byte		"LinIf_LinTrcvDrvCalls_t"
	.byte		0
	.4byte		.L320
.L318:
	.sleb128	13
	.4byte		.L319
.L317:
	.sleb128	14
	.4byte		.L318
.L323:
	.sleb128	11
	.byte		"unsigned long"
	.byte		0
	.byte		0x7
	.byte		0x4
.L322:
	.sleb128	12
	.byte		"uint32"
	.byte		0
	.4byte		.L323
.L321:
	.sleb128	13
	.4byte		.L322
.L325:
	.sleb128	12
	.byte		"LinIf_ChannelState_t"
	.byte		0
	.4byte		.L326
.L324:
	.sleb128	13
	.4byte		.L325
.L329:
	.sleb128	12
	.byte		"LinIf_LinDrvCalls_t"
	.byte		0
	.4byte		.L330
.L328:
	.sleb128	13
	.4byte		.L329
.L327:
	.sleb128	14
	.4byte		.L328
.L333:
	.sleb128	12
	.byte		"LinIfChannelManager"
	.byte		0
	.4byte		.L334
.L332:
	.sleb128	14
	.4byte		.L333
.L331:
	.sleb128	13
	.4byte		.L332
.L336:
	.sleb128	12
	.byte		"LinIfSchTableType_t"
	.byte		0
	.4byte		.L337
.L338:
	.sleb128	12
	.byte		"LinIf_SchHandleType"
	.byte		0
	.4byte		.L288
.L340:
	.sleb128	11
	.byte		"unsigned short"
	.byte		0
	.byte		0x7
	.byte		0x2
.L339:
	.sleb128	12
	.byte		"uint16"
	.byte		0
	.4byte		.L340
.L341:
	.sleb128	12
	.byte		"LinIf_BusStatusStruct"
	.byte		0
	.4byte		.L342
.L343:
	.sleb128	12
	.byte		"LinIf_ChannelSubState_t"
	.byte		0
	.4byte		.L344
.L346:
	.sleb128	12
	.byte		"Lin_StatusType"
	.byte		0
	.4byte		.L288
.L347:
	.sleb128	12
	.byte		"LinIf_frameStatusType"
	.byte		0
	.4byte		.L348
.L351:
	.sleb128	12
	.byte		"LinIfEntry"
	.byte		0
	.4byte		.L352
.L350:
	.sleb128	13
	.4byte		.L351
.L349:
	.sleb128	14
	.4byte		.L350
	.section	.debug_info,,n
.L353:
	.sleb128	15
	.4byte		.L354-.L2
	.4byte		.L288
	.section	.debug_info,,n
	.sleb128	16
	.uleb128	7
	.sleb128	0
.L354:
.L356:
	.sleb128	13
	.4byte		.L339
.L357:
	.sleb128	13
	.4byte		.L338
.L360:
	.sleb128	12
	.byte		"LinIfFrame"
	.byte		0
	.4byte		.L361
.L359:
	.sleb128	13
	.4byte		.L360
.L358:
	.sleb128	14
	.4byte		.L359
.L364:
	.sleb128	12
	.byte		"Lin_FrameCsModelType"
	.byte		0
	.4byte		.L288
.L363:
	.sleb128	13
	.4byte		.L364
.L366:
	.sleb128	12
	.byte		"LinIfFrameType_t"
	.byte		0
	.4byte		.L367
.L365:
	.sleb128	13
	.4byte		.L366
.L369:
	.sleb128	12
	.byte		"Lin_FrameDlType"
	.byte		0
	.4byte		.L288
.L368:
	.sleb128	13
	.4byte		.L369
.L371:
	.sleb128	12
	.byte		"Lin_FramePidType"
	.byte		0
	.4byte		.L288
.L370:
	.sleb128	13
	.4byte		.L371
.L373:
	.sleb128	12
	.byte		"PduIdType"
	.byte		0
	.4byte		.L339
.L372:
	.sleb128	13
	.4byte		.L373
.L375:
	.sleb128	12
	.byte		"Lin_FrameResponseType"
	.byte		0
	.4byte		.L288
.L374:
	.sleb128	13
	.4byte		.L375
.L376:
	.sleb128	15
	.4byte		.L377-.L2
	.4byte		.L314
	.sleb128	16
	.uleb128	7
	.sleb128	0
.L377:
.L380:
	.sleb128	12
	.byte		"LinIfSubstitutionFrames"
	.byte		0
	.4byte		.L381
.L379:
	.sleb128	13
	.4byte		.L380
.L378:
	.sleb128	14
	.4byte		.L379
	.section	.debug_info,,n
.L385:
	.sleb128	17
	.4byte		.L386-.L2
	.4byte		.L287
	.byte		0x1
	.section	.debug_info,,n
	.sleb128	18
	.4byte		.L288
	.sleb128	18
	.4byte		.L293
	.sleb128	0
.L386:
.L384:
	.sleb128	14
	.4byte		.L385
.L388:
	.sleb128	17
	.4byte		.L389-.L2
	.4byte		.L287
	.byte		0x1
	.sleb128	18
	.4byte		.L288
.L390:
	.sleb128	14
	.4byte		.L293
	.sleb128	18
	.4byte		.L390
	.sleb128	0
.L389:
.L387:
	.sleb128	14
	.4byte		.L388
.L392:
	.sleb128	17
	.4byte		.L393-.L2
	.4byte		.L287
	.byte		0x1
	.sleb128	18
	.4byte		.L288
.L395:
	.sleb128	12
	.byte		"LinTrcv_TrcvWakeupReasonType"
	.byte		0
	.4byte		.L396
.L394:
	.sleb128	14
	.4byte		.L395
	.sleb128	18
	.4byte		.L394
	.sleb128	0
.L393:
.L391:
	.sleb128	14
	.4byte		.L392
.L398:
	.sleb128	17
	.4byte		.L399-.L2
	.4byte		.L287
	.byte		0x1
	.sleb128	18
	.4byte		.L288
.L400:
	.sleb128	12
	.byte		"LinTrcv_TrcvWakeupModeType"
	.byte		0
	.4byte		.L401
	.sleb128	18
	.4byte		.L400
	.sleb128	0
.L399:
.L397:
	.sleb128	14
	.4byte		.L398
.L403:
	.sleb128	17
	.4byte		.L404-.L2
	.4byte		.L287
	.byte		0x1
	.sleb128	18
	.4byte		.L288
	.sleb128	0
.L404:
.L402:
	.sleb128	14
	.4byte		.L403
.L407:
	.sleb128	17
	.4byte		.L408-.L2
	.4byte		.L287
	.byte		0x1
	.sleb128	18
	.4byte		.L288
.L410:
	.sleb128	12
	.byte		"Lin_PduType"
	.byte		0
	.4byte		.L411
.L409:
	.sleb128	14
	.4byte		.L410
	.sleb128	18
	.4byte		.L409
	.sleb128	0
.L408:
.L406:
	.sleb128	14
	.4byte		.L407
.L413:
	.sleb128	17
	.4byte		.L414-.L2
	.4byte		.L287
	.byte		0x1
	.sleb128	18
	.4byte		.L288
	.sleb128	0
.L414:
.L412:
	.sleb128	14
	.4byte		.L413
.L416:
	.sleb128	17
	.4byte		.L417-.L2
	.4byte		.L287
	.byte		0x1
	.sleb128	18
	.4byte		.L288
	.sleb128	0
.L417:
.L415:
	.sleb128	14
	.4byte		.L416
.L419:
	.sleb128	17
	.4byte		.L420-.L2
	.4byte		.L287
	.byte		0x1
	.sleb128	18
	.4byte		.L288
	.sleb128	0
.L420:
.L418:
	.sleb128	14
	.4byte		.L419
.L422:
	.sleb128	17
	.4byte		.L423-.L2
	.4byte		.L346
	.byte		0x1
	.sleb128	18
	.4byte		.L288
.L425:
	.sleb128	14
	.4byte		.L288
.L424:
	.sleb128	14
	.4byte		.L425
	.sleb128	18
	.4byte		.L424
	.sleb128	0
.L423:
.L421:
	.sleb128	14
	.4byte		.L422
.L427:
	.sleb128	17
	.4byte		.L428-.L2
	.4byte		.L287
	.byte		0x1
	.sleb128	18
	.4byte		.L288
	.sleb128	0
.L428:
.L426:
	.sleb128	14
	.4byte		.L427
.L7:
	.sleb128	0
.L3:

	.section	.debug_loc,,n
	.align	0
.L292:
	.d2locreg	%offsetof(.Llo1), %offsetof(.Llo2),3
	.d2locreg	%offsetof(.Llo3), %offsetof(.Llo4),3
	.d2locend
.L295:
	.d2locreg	%offsetof(.Llo1), %offsetof(.Llo5),4
	.d2locreg	%offsetof(.Llo6), %offsetof(.Llo7),31
	.d2locend
.L297:
	.d2locreg	%offsetof(.Llo8), %offsetof(.Llo6),5
	.d2locreg	%offsetof(.Llo7), %offsetof(.Llo9),3
	.d2locreg	%offsetof(.Llo10), %offsetof(.Llo11),5
	.d2locend
	.wrcm.doc
	.wrcm.elem
	.wrcm.nelem "code"
	.wrcm.nelem "functions"
	.wrcm.nelem "LinIf_SetTrcvMode"
	.wrcm.nint32 "frameSize", 32
	.wrcm.nint32 "indirectCalls", 1
	.wrcm.nstrlist "calls", "LinIf_FindChannel"
	.wrcm.end
	.wrcm.end
	.wrcm.end
	.wrcm.nelem "tools"
	.wrcm.nelem "llopt"
	.wrcm.nelem "version"
	.wrcm.nstr "string", "5.9.6.4"
	.wrcm.nint32 "number", 5964
	.wrcm.nstr "path", "C:\WindRiver\compilers\diab-5.9.6.4\WIN32\bin\llopt.exe"
	.wrcm.nstr "label", "DIAB_5_9_6_4-FCS_20170817_111028"
	.wrcm.end
	.wrcm.end
	.wrcm.nelem "etoa"
	.wrcm.nelem "version"
	.wrcm.nstr "string", "5.9.6.4"
	.wrcm.nint32 "number", 5964
	.wrcm.nstr "path", "C:\WindRiver\compilers\diab-5.9.6.4\WIN32\lib\etoa.exe"
	.wrcm.nstr "label", "DIAB_5_9_6_4-FCS_20170817_111028"
	.wrcm.end
	.wrcm.nstr "options", "-ei4618 -Xmake-opt-key=objs\MPC5746R_ECU\WindRiver\LinIf_SetTrcvMode.o -Xsingle-fp -Xno-double -Xuser-specified-proc=PPCE200Z4204N3V -XPPCE200Z4 -Xname-code=.text_vle -Xname-const=.text_vle -Xname-uconst=.text_vle -Xname-string=.text_vle -Xstsw-slow -Xintrinsic-mask=0xc00041 -Xconventions-eabi -Xsoft-float -Xdouble-avoid -Xcoloring -Xapu-efpu-v2 -Xefpu-spfs -Xtarget-family=2 -Xlicense-proxy-use -Xlicense-proxy-path=C:\WINDRI~1\COMPIL~1\DIAB-5~1.4\WIN32 -Xdialect-c99 -Xforce-prototypes -Xforce-declarations -Xsmall-data=0 -Xsmall-const=0 -Xlocal-data-area=0 -Xnested-interrupts -Xdebug-inline-on -Xoptimized-debug-off -Xdebug-dwarf2 -Xpass-source -Xmake-dependency-canonicalize-path-off -Xmake-dependency=0x4 -Xc-mode -Xmake-dependency-target=objs\MPC5746R_ECU\WindRiver\LinIf_SetTrcvMode.o -Xmake-dependency-savefile=objs\MPC5746R_ECU\WindRiver\LinIf_SetTrcvMode.d -Xmake-opt-key=objs\MPC5746R_ECU\WindRiver\LinIf_SetTrcvMode.o -MC:\WINDRI~1\COMPIL~1\DIAB-5~1.4\PPC\PPCVLE.cd -ZC:\WINDRI~1\COMPIL~1\DIAB-5~1.4\WIN32\lib\cderror.cat -Xsingle-fp -Xno-double -Xuser-specified-proc=PPCE200Z4204N3V -XPPCE200Z4 -Xname-code=.text_vle -Xname-const=.text_vle -Xname-uconst=.text_vle -Xname-string=.text_vle -Xstsw-slow -Xintrinsic-mask=0xc00041 -Xconventions-eabi -Xsoft-float -Xdouble-avoid -Xcoloring -Xapu-efpu-v2 -Xefpu-spfs -Xtarget-family=2 -Xlicense-proxy-use -Xlicense-proxy-path=C:\WINDRI~1\COMPIL~1\DIAB-5~1.4\WIN32 -Xdialect-c99 -Xforce-prototypes -Xforce-declarations -Xsmall-data=0 -Xsmall-const=0 -Xlocal-data-area=0 -Xnested-interrupts -ei4618 -g2 -Xdebug-inline-on -Xoptimized-debug-off -Xdebug-dwarf2 -Xpass-source -Xmake-dependency-canonicalize-path-off -Xmake-dependency=0x4 -Xc-mode -Xmake-dependency-target=objs\MPC5746R_ECU\WindRiver\LinIf_SetTrcvMode.o -Xmake-dependency-savefile=objs\MPC5746R_ECU\WindRiver\LinIf_SetTrcvMode.d"
	.wrcm.end
	.wrcm.end
	.wrcm.nelem "file"
	.wrcm.nstr "input", "d:\VSB_Demo\VSTAR_MPC5746R_Diab_PR_4.2.2_g_3.0_10\VSTAR\BSWs\COM\LinIf\ssc\make\..\src\LinIf_SetTrcvMode.c"
	.wrcm.end
	.wrcm.end
	.wrcm.end