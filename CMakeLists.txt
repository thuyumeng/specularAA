cmake_minimum_required(VERSION 3.10)

project(specularAA VERSION 1.0)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
MESSAGE(STATUS "${specularAA_VERSION_MAJOR} here test")
configure_file(specularAAConfig.h.in specularAAConfig.h)


# 关闭glfw源码的test和examples
set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(BUILD_SHARED_LIBS ON CACHE BOOL "" FORCE)

# 添加头文件 glfw
add_subdirectory(glfw)
include_directories(glfw/include)

# glad：各个平台的OpenGL函数的加载
set(GLFW_SOURCE_DIR glfw)
set(GLAD_GL "${GLFW_SOURCE_DIR}/deps/glad/gl.h"
            "${GLFW_SOURCE_DIR}/deps/glad_gl.c")
include_directories("${GLFW_SOURCE_DIR}/deps")

# 添加graphics 现在主要是shader模块
set (GRAPHICS "graphics/shader.h"
              "graphics/shader.cpp"
              "stb/stb_image.h")

# 生成可执行文件
add_executable(instance instance.cpp ${GLAD_GL} ${GRAPHICS})

# 版本管理specularConfig.h文件路径
target_include_directories(instance PUBLIC "${PROJECT_BINARY_DIR}" "${PROJECT_SOURCE_DIR}")

# 添加glfw的lib
target_link_libraries(instance glfw ${GLFW_LIBRARIES})
