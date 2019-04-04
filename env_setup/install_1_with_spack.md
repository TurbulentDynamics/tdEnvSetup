# Installing applications with spack
#### [spack](https://spack.readthedocs.io/en/latest/) allows multiple versions of each app, and uses [environment modules](http://modules.sourceforge.net) to "load" them.  It is very usefull for hpc environments, and can be used to install apps into home directory on 'clusters.'



## Installing spack
```
cd ~
git clone https://github.com/spack/spack.git

echo 'export SPACK_ROOT=~/spack'>>~/.bashrc
echo 'export PATH=$SPACK_ROOT/bin:$PATH'>>~/.bashrc
echo '. $SPACK_ROOT/share/spack/setup-env.sh'>>~/.bashrc
. ~/.bashrc
spack bootstrap
```

## Installing applications with spack
```
spack install gcc@8.2.0 
spack load gcc@8.2.0
spack compiler find

CC=%gcc@8.2.0

spack install cmake@3.12.3${CC} openmpi@3.1.2${CC} openmpi@2.1.5${CC} mpich@3.2.1${CC}
spack install gcc@7.3.0${CC} gcc@6.4.0${CC} gcc@5.5.0${CC} rust@1.8.0${CC}
spack install llvm@7.0.0${CC}
spack install octave@4.2.1


#Download pgi from pgroup.com and from the download directory
#spack install pgi
```

#For Ubuntu Linux
```
spack install swift
spack install python@3.7.0%gcc@8.2.0 
```

#For MacOS [python issue on mac](https://github.com/spack/spack/issues/2230)
```
spack install python@3.7.0%clang@10.0.0-apple
```




