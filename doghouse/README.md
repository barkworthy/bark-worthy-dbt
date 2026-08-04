To load the env file
    source /mnt/c/Users/maddie/Desktop/Bark-Worthy/infra/.env

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

To bring you to /Bark-Worthy
    cd (without anything else)

To activate virtual environment
    source .venv/bin/activate