################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../source/3140_concur.c \
../source/led.c \
../source/process.c \
../source/test_1.c 

S_SRCS += \
../source/3140.s \
../source/led_lowlevel.s 

C_DEPS += \
./source/3140_concur.d \
./source/led.d \
./source/process.d \
./source/test_1.d 

OBJS += \
./source/3140.o \
./source/3140_concur.o \
./source/led.o \
./source/led_lowlevel.o \
./source/process.o \
./source/test_1.o 


# Each subdirectory must supply rules for building sources it contributes
source/%.o: ../source/%.s source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU Assembler'
	arm-none-eabi-gcc -c -x assembler-with-cpp -D__REDLIB__ -I"C:\Users\Kelvi\Documents\MCUXpressoIDE_24.12.148\Embed2025\Embed2025\Lab 3\board" -I"C:\Users\Kelvi\Documents\MCUXpressoIDE_24.12.148\Embed2025\Embed2025\Lab 3\source" -I"C:\Users\Kelvi\Documents\MCUXpressoIDE_24.12.148\Embed2025\Embed2025\Lab 3" -I"C:\Users\Kelvi\Documents\MCUXpressoIDE_24.12.148\Embed2025\Embed2025\Lab 3\drivers" -I"C:\Users\Kelvi\Documents\MCUXpressoIDE_24.12.148\Embed2025\Embed2025\Lab 3\CMSIS" -I"C:\Users\Kelvi\Documents\MCUXpressoIDE_24.12.148\Embed2025\Embed2025\Lab 3\startup" -I"C:\Users\Kelvi\Documents\MCUXpressoIDE_24.12.148\Embed2025\Embed2025\Lab 3\utilities" -g3 -gdwarf-4 -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -specs=redlib.specs -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

source/%.o: ../source/%.c source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_MKL46Z256VLL4_cm0plus -DCPU_MKL46Z256VLL4 -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\Kelvi\Documents\MCUXpressoIDE_24.12.148\Embed2025\Embed2025\Lab 3\board" -I"C:\Users\Kelvi\Documents\MCUXpressoIDE_24.12.148\Embed2025\Embed2025\Lab 3\source" -I"C:\Users\Kelvi\Documents\MCUXpressoIDE_24.12.148\Embed2025\Embed2025\Lab 3" -I"C:\Users\Kelvi\Documents\MCUXpressoIDE_24.12.148\Embed2025\Embed2025\Lab 3\drivers" -I"C:\Users\Kelvi\Documents\MCUXpressoIDE_24.12.148\Embed2025\Embed2025\Lab 3\CMSIS" -I"C:\Users\Kelvi\Documents\MCUXpressoIDE_24.12.148\Embed2025\Embed2025\Lab 3\startup" -I"C:\Users\Kelvi\Documents\MCUXpressoIDE_24.12.148\Embed2025\Embed2025\Lab 3\utilities" -O0 -fno-common -g3 -gdwarf-4 -Wall -c -ffunction-sections -fdata-sections -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-source

clean-source:
	-$(RM) ./source/3140.o ./source/3140_concur.d ./source/3140_concur.o ./source/led.d ./source/led.o ./source/led_lowlevel.o ./source/process.d ./source/process.o ./source/test_1.d ./source/test_1.o

.PHONY: clean-source

