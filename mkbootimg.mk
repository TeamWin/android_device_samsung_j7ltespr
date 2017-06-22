# recovery

BOARD_MKBOOTIMG_ARGS += --base 0x80000000 --ramdisk_offset 0x02000000 --tags_offset 0x01E00000 --dt $(TARGET_PREBUILT_DTB)

LZMA_RAMDISK := $(PRODUCT_OUT)/ramdisk-recovery-lzma.img

$(LZMA_RAMDISK): $(recovery_ramdisk)
	gunzip -f < $(recovery_ramdisk) | lzma -e > $@

PRE_FLASH_IMAGE_TARGET ?= $(PRODUCT_OUT)/recovery.tar
#FLASH_IMAGE_TARGET ?= $(PRODUCT_OUT)/recovery.tar.md5

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(INSTALLED_DTIMAGE_TARGET) \
		$(LZMA_RAMDISK) \
		$(recovery_kernel)
	@echo -e ${CL_CYN}"----- Making recovery image ------"${CL_RST}
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --dt $(INSTALLED_DTIMAGE_TARGET) --output $@ --ramdisk $(LZMA_RAMDISK)
	@echo -e ${CL_GRN}"----- Lying about SEAndroid state to Samsung bootloader ------"${CL_RST}
	$(hide) echo -n "SEANDROIDENFORCE" >> $(INSTALLED_RECOVERYIMAGE_TARGET)
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	$(hide) tar -C $(PRODUCT_OUT) -H ustar -c recovery.img > $(PRE_FLASH_IMAGE_TARGET)
	#$(hide) md5sum -t $(PRE_FLASH_IMAGE_TARGET) >> $(PRE_FLASH_IMAGE_TARGET)
	#$(hide) mv $(PRE_FLASH_IMAGE_TARGET) $(FLASH_IMAGE_TARGET)
	@echo -e ${CL_CYN}"Made Odin flashable recovery tar: ${PRE_FLASH_IMAGE_TARGET}"${CL_RST}
