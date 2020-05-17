add_library(drw STATIC drw.c)
target_include_directories(drw PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(drw PUBLIC util)
