################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src2/main.c \
../Core/Src2/syscalls.c \
../Core/Src2/sysmem.c 

OBJS += \
./Core/Src2/main.o \
./Core/Src2/syscalls.o \
./Core/Src2/sysmem.o 

C_DEPS += \
./Core/Src2/main.d \
./Core/Src2/syscalls.d \
./Core/Src2/sysmem.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src2/%.o Core/Src2/%.su Core/Src2/%.cyclo: ../Core/Src2/%.c Core/Src2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DNUCLEO_F401RE -DSTM32 -DSTM32F401RETx -DSTM32F4 -c -I../Inc -I"C:/Users/hp/Desktop/STM32_Project/stm32f401_project/Services/inc" -I"C:/Users/hp/Desktop/STM32_Project/stm32f401_project/Drivers/inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src2

clean-Core-2f-Src2:
	-$(RM) ./Core/Src2/main.cyclo ./Core/Src2/main.d ./Core/Src2/main.o ./Core/Src2/main.su ./Core/Src2/syscalls.cyclo ./Core/Src2/syscalls.d ./Core/Src2/syscalls.o ./Core/Src2/syscalls.su ./Core/Src2/sysmem.cyclo ./Core/Src2/sysmem.d ./Core/Src2/sysmem.o ./Core/Src2/sysmem.su

.PHONY: clean-Core-2f-Src2

