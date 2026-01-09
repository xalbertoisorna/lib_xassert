## Target name
set(LIB_NAME lib_xassert)

## Source files
file( GLOB_RECURSE    SOURCES_C   "src/*.c" )
file( GLOB_RECURSE    SOURCES_XC   "src/*.xc" )
file( GLOB_RECURSE    SOURCES_CPP "src/*.cpp" )
file( GLOB_RECURSE    SOURCES_ASM "src/*.S"   )

## Ensure source files are found
if(NOT SOURCES_C AND NOT SOURCES_XC AND NOT SOURCES_CPP AND NOT SOURCES_ASM)
    message(FATAL_ERROR "No source files found for ${LIB_NAME}")
endif()

## Add library
add_library(${LIB_NAME} STATIC ${SOURCES_C} ${SOURCES_XC} ${SOURCES_CPP} ${SOURCES_ASM})

## Include directories
target_include_directories(${LIB_NAME}
    PUBLIC
        api
        src
)

## Compile options
target_compile_options(${LIB_NAME}
    PRIVATE
        -Os -g
)
