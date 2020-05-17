
find_library(X11_LIB
  HINTS ${X11_DIR} /opt/X11/
  NAMES libX11.dylib libX11.so libX11.a
  PATH_SUFFIXES lib
)

find_library(FONTCONFIG_LIB
  HINTS ${X11_DIR} /opt/X11/
  NAMES libfontconfig.dylib libfontconfig.so
  PATH_SUFFIXES lib
)

# find_library(XINERAMA_LIB
#   HINTS ${X11_DIR} /opt/X11/
#   NAMES libXinerama.dylib libXinerama.so
#   PATH_SUFFIXES lib
# )

find_library(XFT_LIB
  HINTS ${X11_DIR} /opt/X11/
  NAMES libXft.dylib
  PATH_SUFFIXES lib
)

find_path(X11_LIBRARY_DIR
  HINTS ${X11_DIR} /opt/X11/
  NAMES libX11.dylib
  PATH_SUFFIXES lib
)

find_path(X11_INCLUDE_DIR
  HINTS ${X11_DIR} /opt/X11/
  NAMES X.h X11/Xft/Xft.h
  PATH_SUFFIXES include
)

include(FindFreetype)

if(X11_LIBRARY_DIR AND X11_INCLUDE_DIR AND FOUND_FREETYPE)
  set(FOUND_X11 ON)
  add_library(X11 INTERFACE)
  target_compile_options(X11 INTERFACE "-L${X11_LIBRARY_DIR}")
  target_include_directories(X11 INTERFACE ${X11_INCLUDE_DIR})
  target_link_libraries(X11 INTERFACE
      ${XINERAMA_LIB} ${X11_LIB}
      ${XFT_LIB} ${FONTCONFIG_LIB}
      freetype)

  get_target_property(libs X11 INTERFACE_LINK_LIBRARIES)
  message(STATUS "Found X11 library ${libs}")
  message(STATUS "Found X11 include ${X11_INCLUDE_DIR}")
else()
  set(FOUND_X11 OFF)
  message(STATUS "X11 Not found.")
endif()
