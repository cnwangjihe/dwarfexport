cd deps
git clone git://git.code.sf.net/p/libdwarf/code libdwarf
cd libdwarf
git checkout 988618dc8be8
cd ..
curl "https://fossies.org/linux/misc/old/libelf-0.8.13.tar.gz" --output "libelf-0.8.13.tar.gz"
tar -zxf libelf-0.8.13.tar.gz
del /q libelf-0.8.13.tar.gz
cd ..
pause