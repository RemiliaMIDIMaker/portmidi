# lib_needed.cmake

if (UNIX)
	if (APPLE)
		# TODO
	else (APPLE)
		set(PM_NEEDED_LIBS pthread asound)
	endif (APPLE)
else (UNIX)
	set(PM_NEEDED_LIBS winmm)
endif (UNIX)
