@echo off
md include > nul:
md lib > nul:
cd src
copy lua.h ..\include
copy lua.hpp ..\include
copy luaconf.h ..\include
copy lualib.h ..\include
copy lauxlib.h ..\include
nmake /nologo /f makefile.vc BUILD=debug || goto :error
copy lua_d.lib ..\lib || goto :error
nmake /nologo /f makefile.vc BUILD=debug clean || goto :error
nmake /nologo /f makefile.vc BUILD=release || goto :error
copy lua.lib ..\lib || goto :error
nmake /nologo /f makefile.vc BUILD=release clean || goto :error
echo Build succeeded.
cd ..
exit /b 0

:error
echo Build failed, please fix the errors above and restart.
cd ..
exit /b %errorlevel%
