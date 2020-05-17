add_executable(dwm dwm.c) # transient.c)
target_link_libraries(dwm PUBLIC drw)
target_include_directories(dwm PRIVATE ${PROJECT_SOURCE_DIR} ${PROJECT_BINARY_DIR})
