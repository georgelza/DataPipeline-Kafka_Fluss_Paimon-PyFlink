## Environment configuration and deployment

See the master `<root>/README.md` file for the basic downloading of all the containers and library/jar files and building various containers images used and then see the "Run the stack" lower down.


### To test the stack see:

To test the stack see:

It starts with creating a Fluss based catalog, this catalog is created inside Flink, referencing the fluss `bootstrap.servers` which creates the link between the Fluss and Flink environments.

[Manually testing stack](https://alibaba.github.io/fluss-docs/docs/engine-flink/getting-started/#preparation-when-using-flink-sql-client)


```
CREATE CATALOG fluss_catalog WITH (
    'type'              = 'fluss',
    'bootstrap.servers' = 'coordinator-server:9123'
);
```


### Variables and Variables and Variables...

There is sadly no easy way to do this as this is not a small stack, of a single product.

- Start by going into `<root>/devlab0/conf` directory and see the various files there.

- Followed by the `<root>/devlab0/.env` file and then the docker-compose file.

- Also take note of the `configs` section in the `<root>/devlab0/docker-compose.yml` file. These files are mapped into the various services.


### Flink configuration variables.

See the `<root>/devlab0/docker-compose.yaml` file for the various variables passed into the Flink containers.

We use a combination of `enviroment:` values and values from files passed in via the `volumes:` section.

Some of them originate out of the `<root>/devlab0/.env` file, for the Hive environment some originate out of the `<root>/devlab0/conf/hive.env` file and some out of `<root>/devlab0/conf/config.yaml`.

You will also find the logging parameter files are specified in the `configs` section and then mapped into the containers in the services.


### Hive site configuration file/AWS S3 credentials for Flink usage.

Take note that the flink images are build with `<root>/devlab0/conf/hive-site.xml` copied it, this file also contains the credentuals for the MinIO S3 environment.


### PostgreSQL configuration, 

The credentials are sourced from the `<root>/devlab0/.env` file and the start parameters out of `<root>/devlab0/conf/postgresql.conf` & `<root>/devlab0/conf/pg_hba.conf`.


## Run the stack

### Basic last setup steps.

1. `make run`

2. `make ps`        -> until all stable, give is 20-30 seconds.
   
3. `make deploy`    -> This will create our various hive and fluss based tables.
   
4. Now proceed to follow the instructions as per `<root>/devlab0/pyFlink/README.md` to run the varius labs.



### Our Data Generator's.

1. To run Python container app (1) - North based factories

`make rp1`          -> New Source=>Kafka=>Flink=>FLUSS=>Datalake flow. App 1, **factory_iot** collection

1. Stop app (1)

`make sp1`

3. To run Python container app (2) - South based factories

`make rp2`          -> New Source=>Kafka=>Flink=>FLUSS=>Datalake flow. App 2, **factory_iot** collection

1. Stop app (2)

`make sp2`

5. To run Python container app (3) - East based factories

`make rp3`          -> New Source=>Kafka=>Flink=>FLUSS=>Datalake flow. App 3, **factory_iot** collection

1. Stop app (3)

`make sp3`