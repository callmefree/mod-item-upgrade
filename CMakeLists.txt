#
# This file is part of the AzerothCore Project. See AUTHORS file for Copyright information
#

# Define the module name (must match the directory name)
set(MODULE_NAME "mod-item-upgrade")

# Collect all sources from the src directory
file(GLOB SRC_SRC ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)
file(GLOB SRC_HDR ${CMAKE_CURRENT_SOURCE_DIR}/src/*.h)

# Create the module library and link it into worldserver
add_library(${MODULE_NAME} ${SRC_SRC} ${SRC_HDR})
target_link_libraries(${MODULE_NAME} worldserver)

# Install the module configuration (if present)
if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/conf/mod_item_upgrade.conf.dist)
  install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/conf/mod_item_upgrade.conf.dist
    DESTINATION ${CMAKE_INSTALL_PREFIX}/etc/modules/)
endif()
