
## Target name
set(LIB_NAME lib_xassert)

## Source files
file( GLOB_RECURSE    SOURCES_C   "src/*.c" )
file( GLOB_RECURSE    SOURCES_XC  "src/*.xc" )
file( GLOB_RECURSE    SOURCES_CPP "src/*.cpp" )
file( GLOB_RECURSE    SOURCES_ASM "src/*.S"   )

add_library( ${LIB_NAME}  STATIC )

target_sources( ${LIB_NAME}
  PRIVATE
    ${SOURCES_C}
    ${SOURCES_XC}
    ${SOURCES_CPP}
    $<$<PLATFORM_ID:XCORE_XS3A>:${SOURCES_ASM}>
)

target_include_directories( ${LIB_NAME}
  PUBLIC
    api
    xassert
)

target_compile_options( ${LIB_NAME}
  PRIVATE
    -Os -g 
    -Wno-format 
    -Wno-unused-variable 
    -Wno-missing-braces
    # $<$<PLATFORM_ID:XCORE_XS3A>:-Wno-xcore-fptrgroup>
)
