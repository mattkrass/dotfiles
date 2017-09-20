import os
import os.path
import re
import subprocess
import ycm_core
from clang_helpers import PrepareClangFlags

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).

def GetPlinkFlags():
    # try to capture plink if we haven't already
    if not os.path.isfile("captured_plink"):
        rc = subprocess.call("capture_plink")
        if rc != 0:
            print "Failed to capture plink"
        else:
            print "Captured plink"

    if os.path.isfile("captured_plink"):
        plink_flags = subprocess.check_output(["cat", "captured_plink"])
        # remove anything relating to the dummy file we made
        replaced_flags = [s for s in plink_flags.split() if not "plink_capture_dummy" in s and s != '-o']
    else:
        replaced_flags = []

    return replaced_flags

# p1 = subprocess.Popen(["/bbsrc/bin/prod/bin/robolibs-config", "--stdout"], stdout=subprocess.PIPE)
# p2 = subprocess.Popen(["grep", "^ROBO_CPPFLAGS"], stdin=p1.stdout, stdout=subprocess.PIPE)
# output = p2.communicate()[0]

# output = re.sub(r'^ROBO_CPPFLAGS=', r'', output)
# output = re.split(r'\s+', output)

# Add paths to our c++11 headers
cpp_flags = [
'-D_LINUX_SOURCE',
'-DUSE_CLANG_COMPLETER',
'-I',
'/bb/mbige/mbig4627/ycmref/refroot/amd64/opt/bb/lib/gcc-6.2/include/c++/6.2.0',
'-I',
'/bb/mbige/mbig4627/ycmref/refroot/amd64/opt/bb/lib/gcc-6.2/include/c++/6.2.0/x86_64-unknown-linux-gnu',
'-I',
'/bb/mbige/mbig4627/ycmref/refroot/amd64/opt/bb/include',
'-I',
'/bb/build/Linux-x86_64-32/release/robolibs/weekly/opt/bb/include',
'-x',
'c++',
'-std=c++11'
]

c_flags = [
'-I.',
'-I',
'/bb/mbige/mbig4627/ycmref/refroot/amd64/opt/bb/lib/gcc-6.2/include/c++/6.2.0',
'-I',
'/bb/mbige/mbig4627/ycmref/refroot/amd64/opt/bb/lib/gcc-6.2/include/c++/6.2.0/x86_64-unknown-linux-gnu',
'-I',
'/bb/mbige/mbig4627/ycmref/refroot/amd64/opt/bb/include',
'-I',
'/bb/build/Linux-x86_64-32/release/robolibs/weekly/opt/bb/include',
'-D_REENTRANT',
'-D_THREAD_SAFE',
'-DBB_THREADED',
'-Wimplicit',
'-D_LINUX_SOURCE',
'-D_SYS_SYSMACROS_H',
'-DNDEBUG',
'-DUSE_CLANG_COMPLETER',
'-std=c++11',
'-x',
'c',
]

# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''

if compilation_database_folder:
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None


def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )


def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
  if not working_directory:
    return flags
  new_flags = []
  make_next_absolute = False
  path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
  for flag in flags:
    new_flag = flag

    if make_next_absolute:
      make_next_absolute = False
      if not flag.startswith( '/' ):
        new_flag = os.path.join( working_directory, flag )

    for path_flag in path_flags:
      if flag == path_flag:
        make_next_absolute = True
        break

      if flag.startswith( path_flag ):
        path = flag[ len( path_flag ): ]
        new_flag = path_flag + os.path.join( working_directory, path )
        break

    if new_flag:
      new_flags.append( new_flag )
  return new_flags


def FlagsForFile( filename ):
  if database and False:
    # Bear in mind that compilation_info.compiler_flags_ does NOT return a
    # python list, but a "list-like" StringVec object
    compilation_info = database.GetCompilationInfoForFile( filename )
    final_flags = PrepareClangFlags(
        MakeRelativePathsInFlagsAbsolute(
            compilation_info.compiler_flags_,
            compilation_info.compiler_working_dir_ ),
        filename )
  else:
    if filename.endswith('.c'):
      final_flags = c_flags
    else:
      final_flags = GetPlinkFlags() + cpp_flags

  # with open("flags", 'w') as flagsFile:
    # flagsFile.write('\n'.join(final_flags))

  return {
    'flags': final_flags,
    'do_cache': True
  }
