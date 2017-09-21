# burst-plotter #

Docker file for omdcct burst plotter (https://github.com/alter3d/omdcct)

It **should** be build on platform (CPU) on which you will be plotting, otherwise you'll get illegal instruction and core dump (at least in my experience)

### Plotting via Docker
    docker run -it \
      -v /home/burst:/mnt/burst \
      ewrogers/burst-plotter:latest -k $WALLET_NUMERIC_ID -d /mnt/burst/plots -n 614400

**NOTE:** See [omdcct usage](https://github.com/alter3d/omdcct) for more information on command line arguments.
