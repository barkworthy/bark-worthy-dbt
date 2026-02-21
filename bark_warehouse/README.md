To load the env file
    source ~/Desktop/Bark-Worthy/infra/.env

To generate models
    dbt run
    additional tags:
        --select or -s
        --full-refresh
        --target
To test models
    dbt test
        additional tags:
            --select or -s
            --target