/******************************************************************************
*
* This file is automatically generated by Configuration tool.
* Do not edit manually.
*
*==============================================================================
 *
 * Module:       CanTrcv
 *
 * File Name:    CanTrcv_31_TJA1145_PBCfg.c
 *
 * Description:  CAN Transceiver Configuration Source File.
 *  
 *****************************************************************************/
 
 /* SRS Id(s): DEV_SWS_CanTrcv_1002, DEV_SWS_CanTrcv_1003, DEV_SWS_CanTrcv_1004, DEV_SWS_CanTrcv_1006, 
  *            DEV_SWS_CanTrcv_1012, DEV_SWS_CanTrcv_00017 */

 /*=============================== INCLUSIONS ================================*/
#define CANTRCV_31_TJA1145_SYM_NOT_NEEDED /* Disable inclusion of symbolic name information */
#include "Can_GeneralTypes.h"
#include "Spi.h"
#include "CanTrcv_31_TJA1145.h"
 
/*============================ MACRO DEFINITIONS ============================*/
 
/* Maximum number of CanTrcv Channels. */
/* Maximum number of CanTrcv Channels. */
#define CANTRCV_31_TJA1145_MAX_CHANNELS  2

/*============================== VERSION CHECK ==============================*/

/* AUTOSAR specification information: Major version */
#ifdef  CANTRCV_31_TJA1145_PBCFG_C_AR_MAJOR_VERSION
    #error CANTRCV_31_TJA1145_PBCFG_C_AR_MAJOR_VERSION already defined
#endif
#define CANTRCV_31_TJA1145_PBCFG_C_AR_MAJOR_VERSION               (0x04U)

/* AUTOSAR specification information: Minor version */
#ifdef CANTRCV_31_TJA1145_PBCFG_C_AR_MINOR_VERSION
    #error CANTRCV_31_TJA1145_PBCFG_C_AR_MINOR_VERSION already defined
#endif
#define CANTRCV_31_TJA1145_PBCFG_C_AR_MINOR_VERSION               (0x02U)

/* AUTOSAR specification information: Patch version */
#ifdef  CANTRCV_31_TJA1145_PBCFG_C_AR_REVISION_VERSION
    #error CANTRCV_31_TJA1145_PBCFG_C_AR_REVISION_VERSION already defined
#endif
#define CANTRCV_31_TJA1145_PBCFG_C_AR_REVISION_VERSION               (0x02U)


/* File version information: Major version */
#ifdef  CANTRCV_31_TJA1145_PBCFG_C_SW_MAJOR_VERSION
    #error CANTRCV_31_TJA1145_PBCFG_C_SW_MAJOR_VERSION already defined
#endif
#define CANTRCV_31_TJA1145_PBCFG_C_SW_MAJOR_VERSION               (0x01U)

/* File version information: Minor version */
#ifdef  CANTRCV_31_TJA1145_PBCFG_C_SW_MINOR_VERSION
    #error CANTRCV_31_TJA1145_PBCFG_C_SW_MINOR_VERSION already defined
#endif
#define CANTRCV_31_TJA1145_PBCFG_C_SW_MINOR_VERSION               (0x00U)


#if(CANTRCV_31_TJA1145_PBCFG_C_AR_MAJOR_VERSION != CANTRCV_31_TJA1145_AR_RELEASE_MAJOR_VERSION)
    #error "CanTrcv_PBcfg.c : Mismatch in Specification Major Version \
        with CanTrcv.h"
#endif
#if( CANTRCV_31_TJA1145_PBCFG_C_AR_MINOR_VERSION != CANTRCV_31_TJA1145_AR_RELEASE_MINOR_VERSION)
    #error "CanTrcv_PBcfg.c : Mismatch in Specification Minor Version \
        with CanTrcv.h"
#endif

#if( CANTRCV_31_TJA1145_PBCFG_C_SW_MAJOR_VERSION != CANTRCV_31_TJA1145_SW_MAJOR_VERSION)
    #error "CanTrcv_PBcfg.c : Mismatch in Major Version \
        with CanTrcvh"
#endif
#if( CANTRCV_31_TJA1145_PBCFG_C_SW_MINOR_VERSION != CANTRCV_31_TJA1145_SW_MINOR_VERSION)
    #error "CanTrcv_PBcfg.c : Mismatch in Minor Version \
        with CanTrcv.h"
#endif

/*=============================== CONSTANTS =================================*/
/*=============================== CONFIG DATA ===============================*/

#define CANTRCV_31_TJA1145_START_SEC_POSTBUILD_CONST_32 /* PRQA S 3614 */
#include "MemMap.h" /* PRQA S 0841 */

/* Hash key between Post Build and Pre Compile */
static CONST( uint32, CANTRCV_31_TJA1145_CONST) CANTRCV_31_TJA1145_PBtoPCHashValue = (uint32)2386506596U;

/* Hash key between Post Build and Link Time */
static CONST( uint32, CANTRCV_31_TJA1145_CONST) CANTRCV_31_TJA1145_PBtoLTHashValue = (uint32)2011945630U;

#define CANTRCV_31_TJA1145_STOP_SEC_POSTBUILD_CONST_32 /* PRQA S 3614 */
#include "MemMap.h" /* PRQA S 0841 */

/*====================== INTERNAL VARIABLE DEFINITION =======================*/


#define CANTRCV_31_TJA1145_START_SEC_POSTBUILD_CONST_UNSPECIFIED  /* PRQA S 3614 */ 
#include "MemMap.h"  /* PRQA S 5087 */ 


#if (STD_ON == CANTRCV_31_TJA1145_GENERAL_PARTIAL_NETWORKING_SUPPORT)


#endif

/* Configuration Array which holds the  PB configuration parameters of CanTrcvPartialNetwork */
static CONST (CanTrcv_31_TJA1145_PbConfigType, CANTRCV_31_TJA1145_CONST)CanTrcv_31_TJA1145_PbConfig_a[CANTRCV_31_TJA1145_MAX_CHANNELS] =
{
    {
#if (STD_ON == CANTRCV_31_TJA1145_GENERAL_PARTIAL_NETWORKING_SUPPORT)

     0, /**< Can Bus Baud Rate in kbps.*/
    
     FALSE, /**< Can ID is extended or standard.*/
                                                            
     FALSE, /**< selective wake-up function is enabled or disabled in HW    */
                                                
     0, /**< CAN ID of the Wake-up Frame */
    
     0, /**< ID Mask for the selective activation of the transceiver */
                                                      
     0, /**< Data Length of the Wake-up Frame */

     NULL_PTR, /**< nth byte of the data  payload mask */
    
     NULL_PTR, /** < position n in frame of the mask-part */
#endif
     FALSE,  /** < Wake-up detection occured on rising edge of WAKE pin */
    
     FALSE, /** < Wake-up detection occured on falling edge of WAKE pin */
                                                      
     
    },    
    {
#if (STD_ON == CANTRCV_31_TJA1145_GENERAL_PARTIAL_NETWORKING_SUPPORT)

     0, /**< Can Bus Baud Rate in kbps.*/
    
     FALSE, /**< Can ID is extended or standard.*/
                                                            
     FALSE, /**< selective wake-up function is enabled or disabled in HW    */
                                                
     0, /**< CAN ID of the Wake-up Frame */
    
     0, /**< ID Mask for the selective activation of the transceiver */
                                                      
     0, /**< Data Length of the Wake-up Frame */

     NULL_PTR, /**< nth byte of the data  payload mask */
    
     NULL_PTR, /** < position n in frame of the mask-part */
#endif
     FALSE,  /** < Wake-up detection occured on rising edge of WAKE pin */
    
     FALSE, /** < Wake-up detection occured on falling edge of WAKE pin */
                                                      
     
    }    

};


CONST (CanTrcv_31_TJA1145_ConfigType, CANTRCV_31_TJA1145_CONST) CanTrcvConfigSet = 
{
    &CanTrcv_31_TJA1145_PbConfig_a[0],
    
    &CANTRCV_31_TJA1145_PBtoPCHashValue, /** < Hash Key between Pbcfg & cfg Files */
    
    &CANTRCV_31_TJA1145_PBtoLTHashValue /** < Hash Key between Pbcfg & Lcfg Files */
};

#define CANTRCV_31_TJA1145_STOP_SEC_POSTBUILD_CONST_UNSPECIFIED  /* PRQA S 3614 */
#include "MemMap.h"  /* PRQA S 5087 */ 

/*=========================== EXTERNAL CONSTANTS ============================*/

/*====================== EXTERNAL VARIABLE DEFINITION =======================*/

/*====================== EXTERNAL FUNCTION DEFINITIONS ======================*/

/*====================== INTERNAL FUNCTION DEFINITIONS ======================*/

/*=============== END OF FILE CanTrcv_31_TJA1145_PBCfg.c =====================*/
