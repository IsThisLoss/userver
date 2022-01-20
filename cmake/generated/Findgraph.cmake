# AUTOGENERATED, DON'T CHANGE THIS FILE!

 
              
 
 

include(FindPackageHandleStandardArgs)

find_library(graph_LIBRARIES_boost_graph NAMES
  boost_graph
  )
list(APPEND graph_LIBRARIES
  ${graph_LIBRARIES_boost_graph}
)
  
find_path(graph_INCLUDE_DIRS_boost_graph_astar_search_hpp NAMES
  boost/graph/astar_search.hpp
  )
list(APPEND graph_INCLUDE_DIRS
  ${graph_INCLUDE_DIRS_boost_graph_astar_search_hpp}
)
  
 

 
 
find_package_handle_standard_args(
  graph
    REQUIRED_VARS
      graph_LIBRARIES
      graph_INCLUDE_DIRS
      
    FAIL_MESSAGE
      "Could not find `graph` package. Debian: sudo apt update && sudo apt install libboost-graph-dev MacOS: brew install boost"
)
mark_as_advanced(
  graph_LIBRARIES
  graph_INCLUDE_DIRS
  
)
 
if(NOT Boost_FOUND)
  message(FATAL_ERROR "Could not find `graph` package. Debian: sudo apt update && sudo apt install libboost-graph-dev MacOS: brew install boost")
elseif(graph_version_result)
  if(graph_version_result EQUAL 0)
    if(graph_VERSION VERSION_LESS None)
      message(FATAL_ERROR "Found but version is graph_VERSION. Could not find `graph` package. Debian: sudo apt update && sudo apt install libboost-graph-dev MacOS: brew install boost")
    endif()
  else()
    message(WARNING "Can not determine version. ${graph_version_error}")
  endif()
endif()

 
if (NOT TARGET graph)
  add_library(graph INTERFACE IMPORTED GLOBAL)
  if (TARGET Boost::graph)
    target_link_libraries(graph INTERFACE Boost::graph)
  endif(TARGET Boost::graph)
   target_include_directories(graph INTERFACE ${graph_INCLUDE_DIRS})
   target_link_libraries(graph INTERFACE ${graph_LIBRARIES})
  endif(NOT TARGET graph)