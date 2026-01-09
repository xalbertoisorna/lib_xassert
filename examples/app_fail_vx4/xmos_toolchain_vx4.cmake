
# XMOS Clang-based toolchain file
set(CMAKE_SYSTEM_NAME Generic)

# Set the path to your XMOS clang toolchain here if not in PATH
if(DEFINED XMOS_CLANG_PATH)
    set(CMAKE_C_COMPILER "${XMOS_CLANG_PATH}/clang")
    set(CMAKE_CXX_COMPILER "${XMOS_CLANG_PATH}/clang++")
    set(CMAKE_ASM_COMPILER "${XMOS_CLANG_PATH}/clang")
else()
    set(CMAKE_C_COMPILER clang)
    set(CMAKE_CXX_COMPILER clang++)
    set(CMAKE_ASM_COMPILER clang)
endif()

# Set target flags (adjust as needed)
set(CLANG_XMOS_FLAGS "-mcpu=xmos-vx4a")
set(CMAKE_C_FLAGS_INIT "${CLANG_XMOS_FLAGS}")
set(CMAKE_CXX_FLAGS_INIT "${CLANG_XMOS_FLAGS}")
set(CMAKE_ASM_FLAGS_INIT "${CLANG_XMOS_FLAGS}")

# Prevent CMake from adding Windows system libraries and linker flags
set(CMAKE_EXE_LINKER_FLAGS_INIT "")
set(CMAKE_SHARED_LINKER_FLAGS_INIT "")
set(CMAKE_MODULE_LINKER_FLAGS_INIT "")

# Don't use default Windows libraries
set(CMAKE_C_STANDARD_LIBRARIES "" CACHE STRING "" FORCE)
set(CMAKE_CXX_STANDARD_LIBRARIES "" CACHE STRING "" FORCE)

# Don't try to run executables on the host
set(CMAKE_CROSSCOMPILING TRUE)

# Optionally, set output file extension if needed
# set(CMAKE_EXECUTABLE_SUFFIX ".xe")
