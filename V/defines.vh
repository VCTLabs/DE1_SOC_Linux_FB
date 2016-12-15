// *********************************************************************************
// *********************************************************************************
// ***** defines.vh ****************************************************************
// *****
// ***** Created on 14 Dec 2016
// ***** Created by TC
// *********************************************************************************

// ***** If we have not included it before, 
// ***** This symbol _defines_vh is not defined. 

`ifndef _defines_vh_
`define _defines_vh_

// ***** Firmware Version **********************************************************
`define MAJOR_VERSION   8'h01
`define MINOR_VERSION   8'h0A


// ***** Start of include contents **************************************************
`define TRUE      1
`define FALSE     0
`define OK        1
`define FAIL      0


// ***** Comms Defines **************************************************************
`define MESSAGE_TERMINATOR          8'h0D              // carriage return
`define MSG_START_CHAR              8'h1B              // escape 0x1b          
`define MSG_ACK                     8'h01              // normal Ack response
`define MSG_ACK_DUPLICATE           8'h02              // normal Ack, but the sequence number was a repeat
`define MSG_NACK_BAD_COMMAND        8'h83              // bad NAck, command ID doesn't match
`define MSG_NACK_PAYLOAD_TIMEOUT    8'h84              // bad NAck, Payload timeout
`define MSG_NACK_BAD_DEVICE         8'h85              // bad NAck, command ID doesn't match

// ***** SPI BUS defines to improve clarity
`define SPI_DEVICE_ENABLE           1
`define SPI_DEVICE_DISABLE          0

// ***** Command ID Translations ****************************************************
`define	READ_FIRMWARE_VERSION      8'h01
`define	SET_CAPTURE_TRIGGER_CONFIG 8'h02
`define	GET_CAPTURE_TRIGGER_CONFIG 8'h03
`define	TRIGGER_CAPTURE            8'h04
`define  NOTIFY_CAM_EXPOSURE_DONE   8'h05
`define  NOTIFY_CAM_TRANSFER_DONE   8'h06
`define  NOTIFY_INTERLOCK_CHANGE    8'h07
`define  GET_INTERLOCK_STATUS       8'h08
`define  SET_DEVICE_OUTPUT_PWR      8'h09
`define  GET_DEVICE_OUTPUT_PWR      8'h0A
`define  GET_DIGITAL_INPUT_STATE    8'h0B
`define  SET_DIGITAL_OUTPUT_STATE   8'h0C
`define  GET_DIGITAL_OUTPUT_STATE   8'h0D
`define  SET_BF_ILLUM_LEVEL         8'h0E
`define  GET_BF_ILLUM_LEVEL         8'h0F
`define  TOGGLE_NOTIFY_CMND         8'h10
`define  GET_TEMP_STATUS_CMND       8'h11
`define  PDSB_RESET_DEVICE_CMND     8'h14
`define  SET_MANUAL_ILLUMINATION    8'h1A
`define  GET_MANUAL_ILLUMINATION    8'h1B
`define  SET_SERIAL_PORT_CONFIG     8'h81
`define  GET_SERIAL_PORT_CONFIG     8'h82
`define  SEND_SERIAL_CMND           8'h83
`define  SEND_SERIAL_RESP           8'h84
`define  RESET_CAPTURE_TRIGGER      8'hF1



// ***** SET CONFIGURATION Devices ***********************************************************
`define DEVICE_CAMERA1				8'h01
`define DEVICE_CAMERA2				8'h02
`define DEVICE_EXLASER1				8'h03
`define DEVICE_EXLASER2				8'h04
`define DEVICE_EXLASER3				8'h05
`define DEVICE_EXSHUTT1				8'h06
`define DEVICE_EXSHUTT2				8'h07
`define DEVICE_BGHTFLD1				8'h08
`define DEVICE_BGHTFLD2				8'h09

//***** MMP SubStates
`define SUBSTATE_RESET           8'h0F
`define SUBSTATE_ZERO            8'h00
`define SUBSTATE_STRT_DIOFP      8'h01
`define SUBSTATE_WAIT_FOR_DONE   8'h02
`define SUBSTATE_STRT_SPIFP      8'h03
`define SUBSTATE_STRT_SIOFP      8'h03
`define SUBSTATE_VERIFY_STRT     8'h04
`define SUBSTATE_VERIFY_DONE     8'h05
`define SUBSTATE_CHECK_COUNT     8'h06
`define SUBSTATE_VERIFY_FIFO_START  8'h07
`define SUBSTATE_VERIFY_FIFO_DONE   8'h08
`define SUBSTATE_STRT2_SIOFP        8'h09
`define SUBSTATE_VERIFY2_STRT       8'h0A
`define SUBSTATE_CHECK_COUNT2       8'h0B
`define SUBSTATE_SET_STROBE         8'h0C
`define SUBSTATE_DELAY_FOR_TEST     8'h0D

//***** State Machine Defines
`define  STATE_MMP_RX_RESET         0
`define  STATE_MMP_RX_IDLE          1
`define  STATE_MMP_RX_BYTE          2
`define  STATE_MMP_RX_FIFO          3
`define  STATE_MMP_RX_HEADER        4
`define  STATE_MMP_RX_DISMISS_ACK   5
`define  STATE_MMP_RX_CRC_SETUP     6
`define  STATE_MMP_RX_CRC_START     7
`define  STATE_MMP_RX_CRC_MAINT     8
`define  STATE_MMP_RX_CRC_DONE      9
`define  STATE_MMP_RX_IS_PAYLOAD    10
`define  STATE_MMP_RX_PLD_IDLE      11
`define  STATE_MMP_RX_PLD_BYTE      12
`define  STATE_MMP_RX_PLD_FIFO      13
`define  STATE_MMP_RX_PAYLOAD       14
`define  STATE_MMP_RX_DEVICEID      15
`define  STATE_MMP_RX_CMNDID        16
`define  STATE_MMP_RX_RESP_CODE     17
`define  STATE_MMP_RX_WAIT_FOR_TX_START   18
`define  STATE_MMP_RX_WAIT_FOR_TX_DONE    19
`define  STATE_MMP_RX_XFER          20
`define  STATE_MMP_RX_XFER_DONE     21

`endif   // _defines_vh_
// *********************************************************************************
// *********************************************************************************
// *********************************************************************************
