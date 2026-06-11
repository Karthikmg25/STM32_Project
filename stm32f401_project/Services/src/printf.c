/*
 * printf.c
 *
 *  Created on: Jun 5, 2026
 *      Author: hp
 */

#include "../../Services/inc/printf.h"

/*
 * @fn                - _write
 *
 * @brief             - Redirects printf output to USART2.
 *
 * @param[in]         - file : File descriptor (unused)
 * @param[in]         - ptr  : Pointer to data buffer to transmit
 * @param[in]         - len  : Number of bytes to transmit
 *
 * @return            - Number of bytes transmitted
 *
 * @Note              - This function overrides the weak _write()
 *                      function provided in syscall.c.
 *
 *                      It is used by the printf()function
 *                      to send formatted output through
 *                      USART2.
 *
 *                      Data transmission is performed using
 *                      polling mode by waiting for the TXE flag.
 *
 */
int _write(int file, char *ptr, int len)
{
	for(uint16_t i=0; i< len;i++)
	{
		while(!(USART2->SR & (1<< USART_SR_TXE)));

		USART2->DR = *ptr;
		ptr++;

	}

	     return len;
}

/*********************************************************************
 * @fn                - printf_USART2_Init
 *
 * @brief             - Initializes USART2 for printf
 *
 * @param[in]         - none
 *
 * @return            - none
 *
 * @Note              - USART2 is enabled after configuration.
 *
 *                      Call this function once before using
 *                      printf().
 */
void printf_USART2_Init()
{

	// Configure GPIO pins as RX and TX lines:
	// - USART2 RX pin is mapped to PA3 (D0)
	// - USART2 TX pin is mapped to PA2 (D1)
	// - Use Alternate function AF7

	GPIO_Handle_t usart_rx;
	usart_rx.pGPIOx = GPIOA;
	usart_rx.GPIO_PinConfig.GPIO_PinNumber= GPIO_PIN_NO_3;
	usart_rx.GPIO_PinConfig.GPIO_PinMode = GPIO_MODE_ALTFN;
	usart_rx.GPIO_PinConfig.GPIO_PinAltFunMode = AF7;

	GPIO_Handle_t usart_tx;
	usart_tx.pGPIOx = GPIOA;
	usart_tx.GPIO_PinConfig.GPIO_PinNumber= GPIO_PIN_NO_2;
	usart_tx.GPIO_PinConfig.GPIO_PinMode = GPIO_MODE_ALTFN;
	usart_tx.GPIO_PinConfig.GPIO_PinAltFunMode = AF7;

	GPIO_Init(&usart_rx);
	GPIO_Init(&usart_tx);

		// USART2 Configurations

		USART_Handle_t usart;
		usart.pUSARTx = USART2;
		usart.USART_Config.USART_Baud = USART_STD_BAUD_115200	;
		usart.USART_Config.USART_WordLength=USART_WORDLEN_8BITS ;
		usart.USART_Config.USART_Mode=USART_MODE_TXRX ;
		usart.USART_Config.USART_ParityControl= USART_PARITY_DISABLE;
		usart.USART_Config.USART_HWFlowControl= USART_HW_FLOW_CTRL_NONE;

		USART_Init(&usart);

		// Enable USART2
		USART_PeripheralControl(USART2, ENABLE);
}
