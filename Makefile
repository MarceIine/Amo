GAME_NAME := Amo
BUILD_DIR := build
PROJECT_DIR := src
MODULES_DIR := $(PROJECT_DIR)/modules

all: $(BUILD_DIR)/$(GAME_NAME).love

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/$(GAME_NAME).love: $(BUILD_DIR)
	cd $(PROJECT_DIR) && zip -9 -r ../$(BUILD_DIR)/$(GAME_NAME).love *