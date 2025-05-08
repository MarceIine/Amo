GAME_NAME := Amo
BUILD_DIR := build
PROJECT_DIR := src
MODULES_DIR := $(PROJECT_DIR)/modules

MODULE_FILES := $(wildcard $(MODULES_DIR)/* $(MODULES_DIR)/*/*)

ROOT_LUA_FILES := $(wildcard $(PROJECT_DIR)/*.lua $(PROJECT_DIR)/*.conf)

ASSETS := $(wildcard $(PROJECT_DIR)/assets/* $(PROJECT_DIR)/assets/*/*)

all: $(BUILD_DIR)/$(GAME_NAME).love

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/$(GAME_NAME).love: $(MODULE_FILES) $(ROOT_LUA_FILES) $(ASSETS) | $(BUILD_DIR)
	cd $(PROJECT_DIR) && zip -9 -r ../$@ *

.PHONY: all clean

clean:
	rm -rf $(BUILD_DIR)
