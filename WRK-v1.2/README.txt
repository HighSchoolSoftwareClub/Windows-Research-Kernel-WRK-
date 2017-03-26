
Copyright (c) Microsoft Corporation. All rights reserved. 

You may only use this code if you agree to the terms of
the Windows Research Kernel Source Code License agreement
(see License.txt).  If you do not agree to the terms, do not use the code.

***

WRK v1.2

The Windows Research Kernel v1.2 contains the sources for the core of
the Windows (NTOS) kernel and a build environment for a kernel that will run on
    x86     (Windows Server 2003 Service Pack 1) and
    amd64   (Windows XP x64 Professional)
A future version may also support booting WRK kernels on Windows XP x86 systems,
but the current kernels will fail to boot due to differences in some shared 
structures.

The NTOS kernel implements the basic OS functions
for processes, threads, virtual memory and cache managers, I/O management,
the registry, executive functions such as the kernel heap and synchronization,
the object manager, the local procedure call mechanism, the security reference
monitor, low-level CPU management (thread scheduling, Asynchronous and Deferred
Procedure calls, interrupt/trap handling, exceptions), etc.

The NT Hardware Abstraction Layer, file systems, network stacks, and device
drivers are implemented separately from NTOS and loaded into kernel mode
as dynamic libraries.  Sources for these dynamic components are not included
in the WRK, but some are available in various development kits published
by Microsoft, such as the Installable File System (IFS) Kit and the
Windows Driver Development Kit (DDK).

WRK v1.2 includes most of the NTOS kernel sources from the latest released
version of Windows, which supports the AMD64 architecture on the Desktop.
The kernel sources excluded from the kit are primarily in the areas of
plug-and-play, power management, the device verifier, kernel debugger
interface, and virtual dos machine.  The primary modifications to WRK
from the released kernel are related to cleanup and removal of server
support, such as code related to the Intel IA64.

***

Organization of the WRK sources

The file License.txt contains the license covering use of the WRK.

The public\ directory contains a number of include files shared among system
components.  base\ntos\ contains the NTOS sources.

The primary NTOS source components included in the WRK are organized as follows:

    cache\  - cache manager
    config\ - registry implementation
    dbgk\   - user-mode debugger support
    ex\     - executive functions (kernel heap, synchronization, time)
    fsrtl\  - file system run-time support
    io\     - I/O manager
    ke\     - scheduler, CPU management, low-level synchronization
    lpc\    - local procedure call implementation
    mm\     - virtual memory manager
    ob\     - kernel object manager
    ps\     - process/thread support
    se\     - security functions
    wmi\    - Windows Management Instrumentation

    inc\    - NTOS-only include files
    rtl\    - kernel run-time support
    init\   - kernel startup

***

Copying and building the WRK

WRK can be built on Windows Server 2003 or later, or on Windows XP or later.

To copy WRK to your machine: 
- open a console window; 
- switch to DVD;
- switch to \Resources\Windows_Research_Kernel\Get_WRK\;
- run WRKCopy.bat /w <destination_directory>
  (if you run WRKCopy.bat without parameters, WRK will be copied to C:\WRK-v1.2\);
ALTERNATIVELY
- open Windows Explorer (MyComputer);
- create the destination directory on your hard drive;
- switch to DVD;
- navigate to \Resources\Windows_Research_Kernel\Get_WRK\WRK-v1.2\;
- select all files and subdirectories, drag and drop them to the destination 
  directory.

To adjust the WRK environment setting batch file:
- open console window;
- switch to the directory WRK was copied to;
- run Notepad WRKEnv.bat;
- make sure the "set path=..." statement contains the directory WinDbg was 
  installed to; (unchanged WRKEnv.bat refers to default directory 
  C:\Program Files\Debugging Tools for Windows);
- save the file and exit Notepad. 

To build WRK from command line:
- open console window;
- switch to the directory WRK was copied to;
- run Build <arch> (or Rebuild <arch> or Clean <arch>), see note about <arch> 
  below;
ALTERNATIVELY
- open console window;
- switch to the directory WRK was copied to;
- run WRKEnv <arch>, see note about <arch> below;
- switch to base\ntos;
- run nmake %wrkarch%= 

To build WRK in Visual Studio 2008 environment:
- start VS2008;
- open solution <WRK_DIR>\WRK.sln, where <WRK_DIR> is the directory WRK was 
  copied to;
- make sure the configuration is amd64/Win32 or x86/Win32, as is appropriate;
- select Build/Build Solution (or Rebuild Solution, or Clean Solution). 

To start Windows Debugger from command line:
- open console window;
- switch to the directory WRK was copied to;
- run WRKDebug <arch>, see note about <arch> below;
ALTERNATIVELY
- open console window;
- switch to the directory WRK was copied to;
- run WRKEnv <arch>, see note about <arch> below;
- run WinDbg %windbgargs% 
 
-----------------------------------------------------------------------------
NOTE ABOUT <ARCH>

Batch files Build.bat, Rebuild.bat, Clean.bat, WRKEnv.bat and WRKDebug.bat 
take one parameter – target architecture, which is x86 or amd64.
 
For the first use of either of these batch files, default target architecture 
is x86.
 
Once the target architecture was defined (explicitly or by default), it 
cannot be changed for current console window, and <arch> parameter of the 
batch files is ignored.

The title of the window where the WRK environment has been set to some target 
architecture changes to “WRK x86” or “WRK amd64”.

To work with different target architecture, open another console window. 
-----------------------------------------------------------------------------

***
