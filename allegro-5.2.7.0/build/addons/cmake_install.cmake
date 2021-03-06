# Install script for directory: /home/bartosz/Arko/allegro-5.2.7.0/addons

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/bartosz/Arko/allegro-5.2.7.0/build/addons/primitives/cmake_install.cmake")
  include("/home/bartosz/Arko/allegro-5.2.7.0/build/addons/image/cmake_install.cmake")
  include("/home/bartosz/Arko/allegro-5.2.7.0/build/addons/font/cmake_install.cmake")
  include("/home/bartosz/Arko/allegro-5.2.7.0/build/addons/audio/cmake_install.cmake")
  include("/home/bartosz/Arko/allegro-5.2.7.0/build/addons/acodec/cmake_install.cmake")
  include("/home/bartosz/Arko/allegro-5.2.7.0/build/addons/color/cmake_install.cmake")
  include("/home/bartosz/Arko/allegro-5.2.7.0/build/addons/memfile/cmake_install.cmake")
  include("/home/bartosz/Arko/allegro-5.2.7.0/build/addons/native_dialog/cmake_install.cmake")
  include("/home/bartosz/Arko/allegro-5.2.7.0/build/addons/video/cmake_install.cmake")
  include("/home/bartosz/Arko/allegro-5.2.7.0/build/addons/main/cmake_install.cmake")

endif()

