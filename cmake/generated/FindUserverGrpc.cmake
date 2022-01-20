# AUTOGENERATED, DON'T CHANGE THIS FILE!

 
              
 
 

include(FindPackageHandleStandardArgs)

find_library(UserverGrpc_LIBRARIES_grpc NAMES
  grpc
  )
list(APPEND UserverGrpc_LIBRARIES
  ${UserverGrpc_LIBRARIES_grpc}
)
find_library(UserverGrpc_LIBRARIES_grpc++ NAMES
  grpc++
  )
list(APPEND UserverGrpc_LIBRARIES
  ${UserverGrpc_LIBRARIES_grpc++}
)
find_library(UserverGrpc_LIBRARIES_gpr NAMES
  gpr
  )
list(APPEND UserverGrpc_LIBRARIES
  ${UserverGrpc_LIBRARIES_gpr}
)
find_library(UserverGrpc_LIBRARIES_cares NAMES
  cares
  )
list(APPEND UserverGrpc_LIBRARIES
  ${UserverGrpc_LIBRARIES_cares}
)
  
find_path(UserverGrpc_INCLUDE_DIRS_grpc_grpc_h NAMES
  grpc/grpc.h
  )
list(APPEND UserverGrpc_INCLUDE_DIRS
  ${UserverGrpc_INCLUDE_DIRS_grpc_grpc_h}
)
  
 

 
 
find_package_handle_standard_args(
  UserverGrpc
    REQUIRED_VARS
      UserverGrpc_LIBRARIES
      UserverGrpc_INCLUDE_DIRS
      
    FAIL_MESSAGE
      "Could not find `UserverGrpc` package. Debian: sudo apt update && sudo apt install libgrpc-dev libgrpc7 libgrpc++-dev libgrpc++1 protobuf-compiler-grpc MacOS: brew install grpc"
)
mark_as_advanced(
  UserverGrpc_LIBRARIES
  UserverGrpc_INCLUDE_DIRS
  
)
 
if(NOT UserverGrpc_FOUND)
  message(FATAL_ERROR "Could not find `UserverGrpc` package. Debian: sudo apt update && sudo apt install libgrpc-dev libgrpc7 libgrpc++-dev libgrpc++1 protobuf-compiler-grpc MacOS: brew install grpc")
elseif(UserverGrpc_version_result)
  if(UserverGrpc_version_result EQUAL 0)
    if(UserverGrpc_VERSION VERSION_LESS None)
      message(FATAL_ERROR "Found but version is UserverGrpc_VERSION. Could not find `UserverGrpc` package. Debian: sudo apt update && sudo apt install libgrpc-dev libgrpc7 libgrpc++-dev libgrpc++1 protobuf-compiler-grpc MacOS: brew install grpc")
    endif()
  else()
    message(WARNING "Can not determine version. ${UserverGrpc_version_error}")
  endif()
endif()

 
if (NOT TARGET UserverGrpc)
  add_library(UserverGrpc INTERFACE IMPORTED GLOBAL)
   target_include_directories(UserverGrpc INTERFACE ${UserverGrpc_INCLUDE_DIRS})
   target_link_libraries(UserverGrpc INTERFACE ${UserverGrpc_LIBRARIES})
  endif(NOT TARGET UserverGrpc)