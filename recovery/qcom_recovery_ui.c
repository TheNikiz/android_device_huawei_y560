/*
 * Copyright (C) 2009 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <linux/input.h>
#include <errno.h>
#include <fcntl.h>

#include "common.h"
#include "extendedcommands.h"
#include "recovery_ui.h"

char* MENU_HEADERS[] = { NULL };

char* MENU_ITEMS[] = { "reboot system now",
                       "install zip",
                       "wipe data/factory reset",
                       "wipe cache partition",
                       "backup and restore",
                       "mounts and storage",
                       "advanced",
                       NULL };

char const*const LCD_FILE
        = "/sys/class/leds/lcd-backlight/brightness";

static int write_int(char const* path, int value) {
    int fd;
    static int already_warned = 0;

    fd = open(path, O_RDWR);
    if (fd >= 0) {
        char buffer[20];
        int bytes = sprintf(buffer, "%d\n", value);
        int amt = write(fd, buffer, bytes);
        close(fd);
        return amt == -1 ? -errno : 0;
    } else {
        if (already_warned == 0) {
            fprintf(stderr, "write_int failed to open %s\n", path);
            already_warned = 1;
        }
        return -errno;
    }
}

static int device_on_off_lcd_backlight(int on) {
    if(on)
        return write_int(LCD_FILE, 255);
    else
        return write_int(LCD_FILE, 0);
}

void device_ui_init(UIParameters* ui_parameters) {
    /* Turn on backlight */
    device_on_off_lcd_backlight(1);
}

int device_recovery_start() {
    return 0;
}

int device_toggle_display(volatile char* key_pressed, int key_code) {
    return key_code == KEY_HOME;
}

// add here any key combo check to reboot device
int device_reboot_now(volatile char* key_pressed, int key_code) {
    return 0;
}

int device_perform_action(int which) {
    return which;
}

int device_wipe_data() {
    return 0;
}
