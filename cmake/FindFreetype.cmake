
find_library(FREETYPE_LIBRARY
  PATHS ${FREETYPE_DIR} /usr/local/Cellar/freetype/2.10.1/include/freetype2
  NAMES libfreetype.dylib libfreetype.so libfreetype.a
  PATH_SUFFIXES lib
)

find_path(FREETYPE_INCLUDE_DIR
  PATHS ${FREETYPE_DIR} /usr/local/Cellar/freetype/2.10.1/include/freetype2
  NAMES ft2build.h freetype/freetype.h
  PATH_SUFFIXES include include/freetype include/freetype2
)

if(FREETYPE_LIBRARY AND FREETYPE_INCLUDE_DIR)
  set(FOUND_FREETYPE ON)
  add_library(freetype INTERFACE)
  target_link_libraries(freetype INTERFACE ${FREETYPE_LIBRARY})
  target_include_directories(freetype INTERFACE ${FREETYPE_INCLUDE_DIR})
  message(STATUS "Found freetype lib ${FREETYPE_LIBRARY}")
  message(STATUS "Found freetype include ${FREETYPE_INCLUDE_DIR}")
else()
  set(FOUND_FREETYPE OFF)
  message(STATUS "Freetype Not found.")
endif()

