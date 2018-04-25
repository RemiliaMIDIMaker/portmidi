# portmidi
# Roger B. Dannenberg
# 20 Sep 2009

# CMake Modify by Chill Apr 2018

cmake_minimum_required(VERSION 3.0)

project(portmidi)

include_directories(include)

aux_source_directory(source COMMON_SOURCE_FILES)
file(GLOB_RECURSE INCLUDE_FILES "*.h")

if (UNIX)
	if (APPLE)
		message(Apple)
		aux_source_directory(source/platform/mac PLATFROM_SOURCE_FILES)
	else (APPLE)
		message(Linux)
		add_definitions(-DPMALSA)
		aux_source_directory(source/platform/linux PLATFROM_SOURCE_FILES)
	endif (APPLE)
else (UNIX)
	message(Windows)
	aux_source_directory(source/platform/win PLATFROM_SOURCE_FILES)
endif (UNIX)

add_library (
	portmidi STATIC
		${INCLUDE_FILES}
		${COMMON_SOURCE_FILES}
		${PLATFROM_SOURCE_FILES}
)
