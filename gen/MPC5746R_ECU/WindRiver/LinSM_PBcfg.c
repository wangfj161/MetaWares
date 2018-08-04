/******************************************************************************
 *
 *              Copyright 2016 Mentor Graphics Corporation
 *                        All rights reserved
 *
 *  THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION WHICH IS
 *  THE PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS LICENSORS AND IS
 *  SUBJECT TO LICENSE TERMS.
 *
 *
 ******************************************************************************
 *               File: LinSM_PBcfg.c
 *        Description: This header file contains the Post build configuration
 *                     parameters for the LinSM module
 *            Product: LinSM
 *        Assumptions:
 *         Dependency:
 *
 ******************************************************************************
 *  This file is automatically generated by Configuration tool.
 *  Do not edit manually.
 ******************************************************************************
 * <Requirements>
 * AR40_GR_040, AR40_GR_052.1 AR40_GR_082.1
 * <EndRequirements>
 *****************************************************************************/


/*=============================== INCLUSIONS ================================*/

#include "LinSM_Private.h"

/*=============================== CONSTANTS =================================*/
#define LINSM_START_SEC_POSTBUILD_CONST_32
#include "LinSM_MemMap.h"      /* KW MISRA.INCL.INSIDE */

static CONST(uint32, LINSM_CONST_PB) LINSM_PBtoPCHashValue = (uint32)2663715576U;
static CONST(uint32, LINSM_CONST_PB) LINSM_PBtoLTHashValue = (uint32)3247913456U;

#define LINSM_STOP_SEC_POSTBUILD_CONST_32
#include "LinSM_MemMap.h"      /* KW MISRA.INCL.INSIDE */

#define LINSM_START_SEC_POSTBUILD_CONST_8
#include "LinSM_MemMap.h"      /* KW MISRA.INCL.INSIDE */

/* Container for LinSM channel configuration */
static CONST(LinSMScheduleCnt, LINSM_CONST_PB) LinSM_ScheduleTableCnt_a[1] =
{
    1
};

#define LINSM_STOP_SEC_POSTBUILD_CONST_8
#include "LinSM_MemMap.h"      /* KW MISRA.INCL.INSIDE */

#define LINSM_START_SEC_POSTBUILD_CONST_UNSPECIFIED
#include "LinSM_MemMap.h"      /* KW MISRA.INCL.INSIDE */

/* Container for LinSM channel configuration */
CONST(LinSM_ConfigType, LINSM_CONST_PB) LinSMConfigSet =
{
    &LINSM_PBtoPCHashValue,
    &LINSM_PBtoLTHashValue,
    LinSM_ScheduleTableCnt_a
};

#define LINSM_STOP_SEC_POSTBUILD_CONST_UNSPECIFIED
#include "LinSM_MemMap.h"      /* KW MISRA.INCL.INSIDE */

/*************************** End of LinSM_PBcfg *****************************/
