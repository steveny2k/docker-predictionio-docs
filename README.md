# docker-predictionio-docs
0. put file `id_rsa` in the folder containing Dockerfile

1. Build docker image
    ```Bash
    $ docker build -t predictionio_docs .
    ```

2. then start docker container
    ```Bash
    $ docker run -p 4567:4567 --name predictionio_docs_instance -it predictionio_docs /bin/bash
    ```

3. inside the container
    ```Bash
    $ cd /incubator-predictionio/docs/manual
    ```
    then
    ```Bash
    $ bundle exec middleman server
    ```
    to start the web server

4. on host machine, use a browser to visit:
    ```Bash
    http://localhost:4567
    ```
