/******************************************************************************
*
* This file is automatically generated by Configuration tool.
* Do not edit manually.
*
*==============================================================================
 *
 * Module:       CanTrcv
 *
 * File Name:    CanTrcv_31_TJA1145_LCfg.c
 *
 * Description:  CAN Transceiver Configuration Source File.
 *  
 *****************************************************************************/

 /*=============================== INCLUSIONS ================================*/
#define CANTRCV_31_TJA1145_SYM_NOT_NEEDED /* Disable inclusion of symbolic name information */
#include "Can_GeneralTypes.h"
#include "EcuM.h"
#include "Spi.h"
#include "CanTrcv_31_TJA1145.h"
 
/*============================ MACRO DEFINITIONS ============================*/
 
/* Maximum number of CanTrcv Channels. */
#define CANTRCV_31_TJA1145_MAX_CHANNELS  2

/*============================== VERSION CHECK ==============================*/

/*=============================== CONSTANTS =================================*/

/*=============================== CONFIG DATA ===============================*/
#define CANTRCV_31_TJA1145_START_SEC_CONFIG_DATA_32  /* PRQA S 3614 */ 
#include "MemMap.h"  /* PRQA S 5087 */

/* Hash Key for the Lcfg File */
CONST(uint32, CANTRCV_31_TJA1145_CONST) CanTrcv_31_TJA1145_LTHashValue = (uint32)2011945630U;

/* Hash Key for the Lcfg File */
CONST(uint32, CANTRCV_31_TJA1145_CONST)CanTrcv_31_TJA1145_LTtoPCHashValue = (uint32)2386506596U;

#define CANTRCV_31_TJA1145_STOP_SEC_CONFIG_DATA_32 /* PRQA S 3614 */ 
#include "MemMap.h"  /* PRQA S 5087 */
/*====================== INTERNAL VARIABLE DEFINITION =======================*/

#define CANTRCV_31_TJA1145_START_SEC_VAR_INIT_UNSPECIFIED  /* PRQA S 3614 */ 
#include "MemMap.h"  /* PRQA S 5087 */ 

/* Status Array to hold the values for each Channel. */
static VAR(CanTrcv_31_TJA1145_StatusType, CANTRCV_31_TJA1145_APPL_DATA) CanTrcv_31_TJA1145_Status_a[CANTRCV_31_TJA1145_MAX_CHANNELS] =
{

    {
    CANTRCV_TRCVMODE_NORMAL, /**< Current state of the transceiver */
    
    {0,0,0,0,0,0,0}, /**< Rx buffer for SetOpMode Async Comm */
        
    {0,0,0,0}, /**< Rx buffer for MainFunction Async Comm */
    
    FALSE, /**< Indicates if MainfFunction start Async Transmission or not*/
    
    
    FALSE,    /**< Indicates if Data is available to be read by MainDiagnostic Function */
    
    FALSE , /**< Flag stores whether channel is initialised */

    0, /**< counter holds number of retries in case of failed SPI communication. */
    
    0 /**< counter indicates time since last comm.*/
    },

    {
    CANTRCV_TRCVMODE_NORMAL, /**< Current state of the transceiver */
    
    {0,0,0,0,0,0,0}, /**< Rx buffer for SetOpMode Async Comm */
        
    {0,0,0,0}, /**< Rx buffer for MainFunction Async Comm */
    
    FALSE, /**< Indicates if MainfFunction start Async Transmission or not*/
    
    
    FALSE,    /**< Indicates if Data is available to be read by MainDiagnostic Function */
    
    FALSE , /**< Flag stores whether channel is initialised */

    0, /**< counter holds number of retries in case of failed SPI communication. */
    
    0 /**< counter indicates time since last comm.*/
    }
};

P2VAR (CanTrcv_31_TJA1145_StatusType, AUTOMATIC, CANTRCV_31_TJA1145_APPL_DATA )CANTRCV_31_TJA1145_STATUS_P = 
                                                        &(CanTrcv_31_TJA1145_Status_a[0]);
                                                        
#define CANTRCV_31_TJA1145_STOP_SEC_VAR_INIT_UNSPECIFIED  /* PRQA S 3614 */ 
#include "MemMap.h"  /* PRQA S 5087 */ 

#define CANTRCV_31_TJA1145_START_SEC_CONST_UNSPECIFIED  /* PRQA S 3614 */ 
#include "MemMap.h"  /* PRQA S 5087 */ 


/* Configuration Array which holds the configuration parameters for each channel */
static CONST (CanTrcv_31_TJA1145_LtCfgType, CANTRCV_31_TJA1145_CONST)CanTrcv_31_TJA1145_LT_Config_a[CANTRCV_31_TJA1145_MAX_CHANNELS] =
{
   
    {    
     CANTRCV_TRCVMODE_NORMAL, /* InitState */
     
     1000, /* Max baudrate */    
     
     FALSE, /* ECU Power supply is controlled by the transciever */
     
     TRUE, /* This channel is used */
     
     FALSE, /* Wake up by bus spported */
     
     0, /* CanTrcv Channel Id */
                                                                
     0,  /* POR wake up  source identifier obtained using symbolic name value referred by CanTrcvPorWakeupSourceRef */
                                                        
     0, /* SYSERR wake up  source identifier obtained using symbolic name value referred by CanTrcvSyserrWakeupSourceRef */

     0, /* Bus wake up  source identifier obtained using symbolic name value referred by CanTrcvWakeupSourceRef */

	0,  /* PIN wake up  source identifier obtained using symbolic name value referred by CanTrcvPinWakeupSourceRef */
	
#if (CANTRCV_31_TJA1145_WAKEUP_BY_ICU == CANTRCV_31_TJA1145_GENERAL_WAKE_UP_SUPPORT)     
     0, /* Icu Channel source Identifier obtained using symbolic name value referred by CanTrcvIcuChannelRef*/
#endif                                                        
     TRUE, /* SPI Access type (Sync/Async) */
                                                               
     0, /* maximal number of communication retries In case of failed SPI communication */
                                                     
     0, /* maximal time allowed to the Transceiver in order to reply */    
     
     1, /* The SPI channel Id */
     
     1, /* The SPI Sequence Id */
     
     1, /*CanTrcv ID in the CanIF module*/
     
     
    },   
    {    
     CANTRCV_TRCVMODE_NORMAL, /* InitState */
     
     1000, /* Max baudrate */    
     
     FALSE, /* ECU Power supply is controlled by the transciever */
     
     TRUE, /* This channel is used */
     
     FALSE, /* Wake up by bus spported */
     
     1, /* CanTrcv Channel Id */
                                                                
     0,  /* POR wake up  source identifier obtained using symbolic name value referred by CanTrcvPorWakeupSourceRef */
                                                        
     0, /* SYSERR wake up  source identifier obtained using symbolic name value referred by CanTrcvSyserrWakeupSourceRef */

     0, /* Bus wake up  source identifier obtained using symbolic name value referred by CanTrcvWakeupSourceRef */

	0,  /* PIN wake up  source identifier obtained using symbolic name value referred by CanTrcvPinWakeupSourceRef */
	
#if (CANTRCV_31_TJA1145_WAKEUP_BY_ICU == CANTRCV_31_TJA1145_GENERAL_WAKE_UP_SUPPORT)     
     0, /* Icu Channel source Identifier obtained using symbolic name value referred by CanTrcvIcuChannelRef*/
#endif                                                        
     TRUE, /* SPI Access type (Sync/Async) */
                                                               
     0, /* maximal number of communication retries In case of failed SPI communication */
                                                     
     0, /* maximal time allowed to the Transceiver in order to reply */    
     
     1, /* The SPI channel Id */
     
     2, /* The SPI Sequence Id */
     
     2, /*CanTrcv ID in the CanIF module*/
     
     
    }
};


#define CANTRCV_31_TJA1145_STOP_SEC_CONST_UNSPECIFIED  /* PRQA S 3614 */
#include "MemMap.h"  /* PRQA S 5087 */ 
/*=========================== EXTERNAL CONSTANTS ============================*/

#define CANTRCV_31_TJA1145_START_SEC_CONST_8  /* PRQA S 3614 */ 
#include "MemMap.h"  /* PRQA S 5087 */

/* Transceiver Index */
CONST (uint8, CANTRCV_31_TJA1145_CONST)CANTRCV_31_TJA1145_INDEX_U8   = 0; 
                                                     
#define CANTRCV_31_TJA1145_STOP_SEC_CONST_8  /* PRQA S 3614 */ 
#include "MemMap.h"  /* PRQA S 5087 */ 

#define CANTRCV_31_TJA1145_START_SEC_CONST_16  /* PRQA S 3614 */ 
#include "MemMap.h"  /* PRQA S 5087 */ 

/* Maximum Number of Transceiver Channels in this Driver */
CONST (uint16, CANTRCV_31_TJA1145_CONST)CANTRCV_31_TJA1145_MAXCHANNELS_U16 = CANTRCV_31_TJA1145_MAX_CHANNELS ;

#define CANTRCV_31_TJA1145_STOP_SEC_CONST_16  /* PRQA S 3614 */ 
#include "MemMap.h"  /* PRQA S 5087 */ 

#define CANTRCV_31_TJA1145_START_SEC_CONST_32  /* PRQA S 3614 */ 
#include "MemMap.h"  /* PRQA S 5087 */

/* Wait states for the CanTrc hardware */
CONST (uint32, CANTRCV_31_TJA1145_CONST) CANTRCV_31_TJA1145_WAITCOUNT_U32 = 10000;

/* Pointer for the Configuration Array. */    
CONSTP2CONST(CanTrcv_31_TJA1145_LtCfgType, AUTOMATIC, CANTRCV_31_TJA1145_CONST)CANTRCV_31_TJA1145_LT_CONFIG_P  = 
                                                        &(CanTrcv_31_TJA1145_LT_Config_a[0]);
                                                        

                                                       
#define CANTRCV_31_TJA1145_STOP_SEC_CONST_32  /* PRQA S 3614 */ 
#include "MemMap.h"  /* PRQA S 5087 */ 

/*====================== EXTERNAL VARIABLE DEFINITION =======================*/

#define CANTRCV_31_TJA1145_START_SEC_CONST_32  /* PRQA S 3614 */ 
#include "MemMap.h"  /* PRQA S 5087 */

/**
 * \brief Pointer to Container holding post-build configuration values of CanTrcvChannel.
 *  
 */
P2CONST(CanTrcv_31_TJA1145_PbConfigType,AUTOMATIC,CANTRCV_31_TJA1145_CONST) 
CanTrcv_31_TJA1145_PbConfig_p = NULL_PTR;

#define CANTRCV_31_TJA1145_STOP_SEC_CONST_32  /* PRQA S 3614 */ 
#include "MemMap.h"  /* PRQA S 5087 */ 

/*====================== EXTERNAL FUNCTION DEFINITIONS ======================*/

/*====================== INTERNAL FUNCTION DEFINITIONS ======================*/


/*=============== END OF FILE CanTrcv_31_TJA1145_LCfg.c =====================*/
