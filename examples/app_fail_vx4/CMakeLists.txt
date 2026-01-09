cmake_minimum_required(VERSION 3.21)
set(CMAKE_TOOLCHAIN_FILE
    "${CMAKE_CURRENT_LIST_DIR}/xmos_toolchain_vx4.cmake"
    CACHE FILEPATH "" FORCE
)

set(PROJECT_NAME app_fail_vx4)
project(${PROJECT_NAME})

add_subdirectory(../../lib_xassert lib_xassert)

add_executable(${PROJECT_NAME} src/main.c)



target_include_directories(${PROJECT_NAME}
    PRIVATE
        ${CMAKE_CURRENT_LIST_DIR}/include
)
target_link_libraries(${PROJECT_NAME}
    PRIVATE
        lib_xassert
        ${CMAKE_CURRENT_LIST_DIR}/include/libxc.a
)

target_compile_options(${PROJECT_NAME}
    PRIVATE
        -Os
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/bin"
)
