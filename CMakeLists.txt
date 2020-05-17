
cmake_minimum_required (VERSION 3.1)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(VERSION "6.2")
set(_DEFAULT_SOURCE ON)
set(_BSD_SOURCE ON)
set(_POSIX_C_SOURCE 200809)
set(XINERAMA OFF)
add_library(options INTERFACE)

target_compile_features(options
    INTERFACE
        cxx_std_17
        cxx_alignas
        cxx_alignof
        cxx_attributes
        cxx_auto_type
        cxx_constexpr
        cxx_defaulted_functions
        cxx_deleted_functions
        cxx_final
        cxx_lambdas
        cxx_noexcept
        cxx_override
        cxx_range_for
        cxx_rvalue_references
        cxx_static_assert
        cxx_strong_enums
        cxx_trailing_return_types
        cxx_unicode_literals
        cxx_user_literals
        cxx_variadic_macros
)

project(DWM C)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
configure_file(defs.h.in ${PROJECT_BINARY_DIR}/defs.h @ONLY)

include(FindX11)
add_subdirectory(src)

file(WRITE ${PROJECT_BINARY_DIR}/dwm-launch
"#!/bin/bash

cd ~
while true
do
    xsetroot -name \"`date +\"%Y-%m-%d %H:%M\"`\"
    sleep 5
done &
exec ${PROJECT_BINARY_DIR}/src/dwm/dwm
")
