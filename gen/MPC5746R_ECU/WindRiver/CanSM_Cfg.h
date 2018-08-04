/******************************************************************************
 *
 *             Copyright 2016 Mentor Graphics Corporation
 *                        All rights reserved
 *
 * THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION WHICH IS THE
 * PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS LICENSORS AND IS SUBJECT TO
 * LICENSE TERMS.
 *
 ******************************************************************************
 *
 * This file is automatically generated by Configuration tool.
 * Do not edit manually.
 *
 *=============================================================================
 *
 * Module:       CanSM
 *
 * File Name:    CanSM_Cfg.h
 *
 * Description:  The header file CanSM_Cfg.h shall contain the macros used by
 *               this module, for enabling and disabling some functionality.
 *
 *
 *****************************************************************************/

/*
 * <Requirements> CANSM010 CANSM363 CANSM364 CANSM365 CANSM367 CANSM368
 * AR40_GR_059.1 AR40_GR_060.1 AR40_GR_061.1 AR40_GR_086.1 <EndRequirements>
 */

/*****************************************************************************/

/**
 * \file       CanSM_Cfg.h
 * \brief      The header file CanSM_Cfg.h shall contain the macros used by
 *             this module, for enabling and disabling some functionality.
 * \author     Tool
 * \addtogroup CanSM
 * \{
 */

#ifndef CANSM_CFG_H
#define CANSM_CFG_H

/*============================ MACRO DEFINITIONS ============================*/
/**
 * \defgroup CanSM_Cfg_Macros Configuration Macros
 *  Describes the general Macros used in the CanSM Module
 */

/*\{*/

/* information of CanSM_Cfg.h file */

/**
 * \brief AUTOSAR specification information: Major version
 *
 */
#ifdef  CANSM_CFG_H_AR_RELEASE_MAJOR_VERSION
    #error CANSM_CFG_H_AR_RELEASE_MAJOR_VERSION already defined
#endif
#define CANSM_CFG_H_AR_RELEASE_MAJOR_VERSION               (4u)

/**
 * \brief AUTOSAR specification information: Minor version
 *
 */
#ifdef  CANSM_CFG_H_AR_RELEASE_MINOR_VERSION
    #error CANSM_CFG_H_AR_RELEASE_MINOR_VERSION already defined
#endif
#define CANSM_CFG_H_AR_RELEASE_MINOR_VERSION               (2u)

/**
 * \brief AUTOSAR specification information: Patch version
 *
 */
#ifdef  CANSM_CFG_H_AR_RELEASE_REVISION_VERSION
    #error CANSM_CFG_H_RELEASE_AR_REVISION_VERSION already defined
#endif
#define CANSM_CFG_H_AR_RELEASE_REVISION_VERSION            (2u)


/**
 * \brief File version information: Major version
 *
 */
#ifdef  CANSM_CFG_H_SW_MAJOR_VERSION
    #error CANSM_CFG_H_SW_MAJOR_VERSION already defined
#endif
#define CANSM_CFG_H_SW_MAJOR_VERSION               (5u)

/**
 * \brief File version information: Minor version
 *
 */
#ifdef  CANSM_CFG_H_SW_MINOR_VERSION
    #error CANSM_CFG_H_SW_MINOR_VERSION already defined
#endif
#define CANSM_CFG_H_SW_MINOR_VERSION               (1u)

/**
 * \brief Enables and disables the development error detection and notification
 *        mechanism.
 *
 */
#ifdef CANSM_DEV_ERROR_DETECT
    #error CANSM_DEV_ERROR_DETECT already defined
#endif
#define CANSM_DEV_ERROR_DETECT                      (STD_OFF)

/**
 * \brief Enables and disables the Version Info API
 *
 */
#ifdef CANSM_VERSION_INFO_API
    #error CANSM_VERSION_INFO_API already defined
#endif
#define CANSM_VERSION_INFO_API                      (STD_OFF)

/**
 * \brief Enables and disables the Set Baudrate API
 *
 */
#ifdef CANSM_SET_BAUDRATE_API
    #error CANSM_SET_BAUDRATE_API already defined
#endif
#define CANSM_SET_BAUDRATE_API                      (STD_OFF)


/**
 * \brief Enables and disables the CanSM Trcv support
 *
 */
#ifdef CANSM_TRCV_SUPPORT
    #error CANSM_TRCV_SUPPORT already defined
#endif
#define CANSM_TRCV_SUPPORT                      (STD_ON)

/**
 * \brief Enables and disables the CanSM Partial Network support
 *
 */
#ifdef CANSM_PN_SUPPORT
    #error CANSM_PN_SUPPORT already defined
#endif
#define CANSM_PN_SUPPORT                      (STD_OFF)

/**
 * \brief Enables and disables the CanSM Tx Offline Active support
 *
 */
#ifdef CANSM_TX_OFFLINE_ACTIVE_SUPPORT
    #error CANSM_TX_OFFLINE_ACTIVE_SUPPORT already defined
#endif
#define CANSM_TX_OFFLINE_ACTIVE_SUPPORT                      (STD_OFF)


/**
 * \brief Hash key between Pre Compile and Link Time
 *
 */
#ifdef CANSM_PC_HASH_VALUE
    #error CANSM_PC_HASH_VALUE already defined
#endif
#define CANSM_PC_HASH_VALUE ((uint32)981199489U)


/*\}*/ /* Close for the doxygen group CanSM_Cfg_Macros */

/*\}*/  /* Close for the doxygen group CanSM */

#endif /* CANSM_CFG_H */

/*============================== END OF FILE CanSM_Cfg.h=====================*/

