#include "3140_concur.h"
#include <stdlib.h>
#include <MKL46Z4.h>
#include "process.h"

int process_create (void (*f)(void), int n) {
	/*
	 * Free up some memory to hold the value of current_process.
	 */
	process_t * current_process = (process_t *) malloc(sizeof(process_t));
	// If malloc failed then return an error
	if (!current_process) {
		return -1;
	}

	/*
	 * process_stack_init makes a stack that's 18 + n long.
	 * The 18 is to store the context.
	 *
	 * It returns the pointer to the top of the stack aka
	 * the smallest register address that contains stack data.
	 *
	 * n+18 addresses (aka (n+18)*4 bytes) are allocated for this
	 * stack, so you can store n registers worth of info on this
	 * stack now.
	 */
	current_process->sp = process_stack_init(f, n);
	/*
	 * If malloc in the initialization failed, then process_stack_init will
	 * return -1, so we'll propagate that error upwards.
	 */

	if (!current_process->sp) {
		free(current_process);
		return -1;
	}

	/*
	 * If initialization worked, then store the function into current_process
	 * and enqueue current_process.
	 */
	current_process->function = f;
	enqueue(current_process, &process_queue);

	return 0;
}

void process_start (void) {
	if (is_empty(&process_queue)) {
		return;
	}

	/*
	 * Set up the PIT and IRQ for LED0
	 */
	// Turn on clock to PIT module
	SIM->SCGC6 |= SIM_SCGC6_PIT_MASK;
	// Turn on PIT module
	PIT->MCR &= !PIT_MCR_MDIS_MASK;

	// 150,000 cycles or 10 ms which makes the PIT frequency 100 Hz
	PIT->CHANNEL[0].LDVAL = 0x249F0;

	// Enable interrupt on PIT module
	PIT->CHANNEL[0].TCTRL |= PIT_TCTRL_TIE_MASK | PIT_TCTRL_TEN_MASK;

	/*
	 * Tie the PIT timer to the interrupt handler so that it calls
	 * PIT_IRQHandler when the PIT flags its TFLG register.
	 */
	NVIC_EnableIRQ(22);

	process_begin();
}

unsigned int * process_select (unsigned int * cursp) {

}


















