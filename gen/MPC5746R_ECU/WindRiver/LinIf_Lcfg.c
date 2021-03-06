/******************************************************************************
 *
 *              Copyright 2017 Mentor Graphics Corporation
 *                        All rights reserved
 *
 *  THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION WHICH IS
 *  THE PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS LICENSORS AND IS
 *  SUBJECT TO LICENSE TERMS.
 *
 *
 ******************************************************************************
 *               File: LinIf_Lcfg.c
 *        Description: This header file contains the Link Time configuration
 *                     parameters for the LinIf module
 *            Product: LinIf
 *        Assumptions:
 *         Dependency:
 *
 ******************************************************************************
 * This file is automatically generated by the tool.
 * Do not edit manually.
 ******************************************************************************/

/*=============================== INCLUSIONS ================================*/
#include "LinIf_Private.h"

#include "LinTrcv_31_UJA1132.h"

/* Lin.h */
#include "Lin.h"

/*============================== VERSION CHECK ==============================*/
/*LinTrcv.h*/

#if(LINIF_AR_RELEASE_MAJOR_VERSION != LINTRCV_31_UJA1132_AR_RELEASE_MAJOR_VERSION)
    #error "Major Version mismatch between LinIf_Lcfg.c and LinTrcv_31_UJA1132_Cbk.h!"
#endif
#if ( !( ( 0 == LINTRCV_31_UJA1132_AR_RELEASE_MINOR_VERSION) \
       || ( 2 == LINTRCV_31_UJA1132_AR_RELEASE_MINOR_VERSION) ) )
    #error "Minor Version mismatch between LinIf_Lcfg.c and LinTrcv_31_UJA1132_Cbk.h$"
#endif

#if(LINIF_AR_RELEASE_MAJOR_VERSION != LIN_AR_RELEASE_MAJOR_VERSION)
    #error "Major Version mismatch between LinIf_Lcfg.c and Lin.h!"
#endif
#if ( !( ( 0 == LIN_AR_RELEASE_MINOR_VERSION) \
       || ( 2 == LIN_AR_RELEASE_MINOR_VERSION) ) )
    #error "Minor Version mismatch between LinIf_Lcfg.c and Lin.h!"
#endif

/*====================== INTERNAL VARIABLE DEFINITION =======================*/

#define LINIF_START_SEC_VAR_NO_INIT_UNSPECIFIED
#include "LinIf_MemMap.h" /* KW MISRA.INCL.INSIDE */

/* Channel configuration (The size of the array will be the no of channels configured) */
static VAR(LinIfChannelManager, LINIF_VAR) LinIf_ChannelManager_a[1];

/* Pointer to relocatable channel struct */
P2CONST(LinIfChannelReloc, LINIF_VAR, LINIF_APPL_CONST) LinIf_ConfigChannel_Reloc_p;

#define LINIF_STOP_SEC_VAR_NO_INIT_UNSPECIFIED
#include "LinIf_MemMap.h" /* KW MISRA.INCL.INSIDE */

#define LINIF_START_SEC_CONFIG_DATA_UNSPECIFIED
#include "LinIf_MemMap.h" /* KW MISRA.INCL.INSIDE */

/* Array containing LinIf Channel Id, Lin Reference and LinTrcvId */
static CONST(LinIfChannelIdentifier, LINIF_CONST) LinIf_ChannelIdentifier_a[1] =
{
    {
        0, /* LinTrcvId */
        0, /*Channel Id*/
        0 /* Channel Ref */
    }
};

/* Array of functions of frames */
static CONST(LinIfFrameFunctions, LINIF_CONST) LinIf_ConfigFrameFunctions[1] =
{
    {
        /* Function pointer for <User_LinIfRxIndication> */
        &PduR_LinIfRxIndication,
        /* Function pointer for <User_TxConfirmation> */
        &PduR_LinIfTxConfirmation,
        /* Function pointer for <User_TriggerTransmit> */
        &PduR_LinIfTriggerTransmit
    }
};

/* 'Default' of confirmation ULs: LinSM. Note: must not be static! */
CONST(LinIf_ConfirmationInterfaceConfig_t, LINIF_CONST) LinIf_LinSMConfirmationInterfaceConfig =
{
    /* Function pointer for <User>_GotoSleepConfirmation */
    &LinSM_GotoSleepConfirmation,
    /* Function pointer for <User>_WakeupConfirmation*/
    &LinSM_WakeupConfirmation,
    /* Function pointer for <User>_ScheduleRequestConfirmation */
    &LinSM_ScheduleRequestConfirmation
};

/* Array of CDD confirmation ULs */
static CONST(LinIf_ConfirmationInterfaceConfig_t, LINIF_CONST) LinIf_ConfirmationInterfaceConfig_a[1] =
{
    {
        /* Function pointer for <User>_GotoSleepConfirmation */
        NULL_PTR,
        /* Function pointer for <User>_WakeupConfirmation */
        NULL_PTR,
        /* Function pointer for <User>_ScheduleRequestConfirmation */
        NULL_PTR
    }
};

/* Array of function pointer to the Lin driver */
static CONST(LinIf_LinDrvCalls_t, LINIF_CONST) LinIf_LinDrvCalls_a[1] =
{
    {
        /* Function pointer for Lin_SendFrame */
        &Lin_SendFrame,
        /* Function pointer for Lin_GoToSleep */
        &Lin_GoToSleep,
        /* Function pointer for Lin_GoToSleep */
        &Lin_GoToSleepInternal,
        /* Function pointer for Lin_Wakeup */
        &Lin_Wakeup,
        /* Function pointer for Lin_GetStatus */
        &Lin_GetStatus,
        /* Function pointer for Lin_CheckWakeup */
        &Lin_CheckWakeup
    }
};

/* Array of function pointer to the LinTrcv driver */
static CONST(LinIf_LinTrcvDrvCalls_t, LINIF_CONST) LinIf_LinTrcvDrvCalls_a[1] =
{
    {
        /* Function pointer for LinTrcv_SetOpMode */
        &LinTrcv_31_UJA1132_SetOpMode,
        /* Function pointer for LinTrcv_GetOpMode */
        &LinTrcv_31_UJA1132_GetOpMode,
        /* Function pointer for LinTrcv_GetBusWuReason */
        &LinTrcv_31_UJA1132_GetBusWuReason,
        /* Function pointer for LinTrcv_SetWakeupMode */
        &LinTrcv_31_UJA1132_SetWakeupMode,
        /* Function pointer for LinTrcv_CheckWakeup */
        &LinTrcv_31_UJA1132_CheckWakeup
    }
};

/* Array of LinIf Channels */
static CONST(LinIfChannel, LINIF_CONST) LinIf_ConfigChannelLT[1] =
{
    {
        LinIf_LinTrcvDrvCalls_a,
        0, /*wakeup source id of Lin*/
        0, /*wakeup source id of Trcv*/
        0, /* Internal Channel Index */
        1, /* External Channel Index */
        1, /* required delay after go to sleep */
        LINIF_CHANNEL_OPERATIONAL, /*start up state*/
        LinIf_LinDrvCalls_a,
        &LinIf_ChannelManager_a[0]
    }
};

/* Pointer to get the LinIf Channel Indentifiers */
CONSTP2CONST(LinIfChannelIdentifier, LINIF_CONST, LINIF_APPL_CONST) LinIf_ChannelIdentifier_p = LinIf_ChannelIdentifier_a;

/* Pointer to the link time channel struct */
CONSTP2CONST(LinIfChannel, LINIF_CONST, LINIF_APPL_CONST) LinIf_ConfigChannelLT_p = LinIf_ConfigChannelLT;

/* Pointer to the link time frame functions structure */
CONSTP2CONST(LinIfFrameFunctions, LINIF_CONST, LINIF_APPL_CONST) LinIfFrameFunctions_p = LinIf_ConfigFrameFunctions;

CONSTP2CONST(LinIf_ConfirmationInterfaceConfig_t, LINIF_CONST, LINIF_APPL_CONST) LinIf_ConfirmationInterfaceConfig_p = LinIf_ConfirmationInterfaceConfig_a;

#define LINIF_STOP_SEC_CONFIG_DATA_UNSPECIFIED
#include "LinIf_MemMap.h" /* KW MISRA.INCL.INSIDE */

#define LINIF_START_SEC_CONFIG_DATA_32
#include "LinIf_MemMap.h" /* KW MISRA.INCL.INSIDE */

/* Hash key between Link Time and Pre Compile for LinIf */
CONST(uint32, LINIF_CONST) LinIf_LTtoPCHashValue = (uint32)2561217458U;

/* Hash key between Link Time and Post build for LinIf */
CONST(uint32, LINIF_CONST) LinIf_LTHashValue = (uint32)911557151U;

/* Hash key between Link Time and Pre Compile for LinTp */
CONST(uint32, LINIF_CONST) LinTp_LTtoPCHashValue = (uint32)2561217458U;

/* Hash key between Link Time and Post build for LinTp */
CONST(uint32, LINIF_CONST) LinTp_LTHashValue = (uint32)911557151U;

#define LINIF_STOP_SEC_CONFIG_DATA_32
#include "LinIf_MemMap.h" /* KW MISRA.INCL.INSIDE */

/*==================== END OF FILE LinIf_Lcfg.c ====================*/
