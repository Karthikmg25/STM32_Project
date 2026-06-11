################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Services/src/TIMERs_Baremetal.c \
../Services/src/USART_Baremetal.c \
../Services/src/printf.c 

OBJS += \
./Services/src/TIMERs_Baremetal.o \
./Services/src/USART_Baremetal.o \
./Services/src/printf.o 

C_DEPS += \
./Services/src/TIMERs_Baremetal.d \
./Services/src/USART_Baremetal.d \
./Services/src/printf.d 


# Each subdirectory must supply rules for building sources it contributes
Services/src/%.o Services/src/%.su Services/src/%.cyclo: ../Services/src/%.c Services/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DNUCLEO_F401RE -DSTM32 -DSTM32F401RETx -DSTM32F4 -c -I../Inc -I"C:/Users/hp/Desktop/STM32_Project/stm32f401_project/Services/inc" -I"C:/Users/hp/Desktop/STM32_Project/stm32f401_project/Drivers/inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Services-2f-src

clean-Services-2f-src:
	-$(RM) ./Services/src/TIMERs_Baremetal.cyclo ./Services/src/TIMERs_Baremetal.d ./Services/src/TIMERs_Baremetal.o ./Services/src/TIMERs_Baremetal.su ./Services/src/USART_Baremetal.cyclo ./Services/src/USART_Baremetal.d ./Services/src/USART_Baremetal.o ./Services/src/USART_Baremetal.su ./Services/src/printf.cyclo ./Services/src/printf.d ./Services/src/printf.o ./Services/src/printf.su

.PHONY: clean-Services-2f-src

