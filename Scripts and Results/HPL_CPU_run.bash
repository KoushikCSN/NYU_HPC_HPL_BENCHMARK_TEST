$ wget http://www.hpl-benchmark.org/downloads/hpl-2.3.tar.gz
$ tar xvzf hpl-2.3.tar.gz

$ cd hpl-2.3
$ nano INSTALL

$ module load openmpi/intel/4.0.5

$ mkdir build
$ cd build

$ cd ../tutoruials/
$ nano Make.MPI_ICPC_OMP

(
    CHANGE

CXXFLAGS = $(hpl_DEFS) -O3 -openmp -mavx

TO

CXXFLAGS = $(hpl_DEFS) -O3 -qopenmp -mavx2
)

 $ cp Make.MPI_ICPC_OMP Make.MPI_ICPC_OMP_DEBUG
 $ nano Make.MPI_ICPC_OMP_DEBUG

 (

CHANGE

hpl_OPTS     =

TO

hpl_OPTS     =  -Dhpl_DEBUG

 )

$ ../configure MPI_ICPC_OMP
$ make

$ cd bin

$ srun --nodes=1 --tasks-per-node=48 --mem=180GB xhpl
$ srun --nodes=4 --tasks-per-node=12 --cpus-per-task=4 --mem=180GB xhpl
