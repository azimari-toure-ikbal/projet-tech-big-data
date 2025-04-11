from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.utils.dates import days_ago

# Paramètres par défaut du DAG
default_args = {
    'owner': 'airflow',
    'start_date': days_ago(1),
    'retries': 1,
    'retry_delay': 300,  # en secondes (5 minutes)
}

with DAG(
    dag_id='dbt_transformations_by_layer',
    default_args=default_args,
    description='Orchestration DBT par couche: STAGGING -> WAREHOUSE -> MARTS',
    schedule_interval=None, 
    catchup=False,
) as dag:

    # Tâche 1 : Exécution des transformations STAGGING
    dbt_run_staging = BashOperator(
        task_id='dbt_run_staging',
        bash_command='cd /Users/ikbal/dev/big_data/dbt-dag/dags/dbt/project && dbt run --models staging',
        env={'DBT_PROFILES_DIR': '~/.dbt'}
    )

    # Tâche 2 : Exécution des transformations WAREHOUSE
    dbt_run_warehouse = BashOperator(
        task_id='dbt_run_warehouse',
        bash_command='cd /Users/ikbal/dev/big_data/dbt-dag/dags/dbt/project && dbt run --models warehouse',
        env={'DBT_PROFILES_DIR': '~/.dbt'}
    )

    # Tâche 3 : Exécution des transformations MARTS
    dbt_run_marts = BashOperator(
        task_id='dbt_run_marts',
        bash_command='cd /Users/ikbal/dev/big_data/dbt-dag/dags/dbt/project && dbt run --models marts',
        env={'DBT_PROFILES_DIR': '~/.dbt'}
    )

    # Définition de l’ordre des tâches
    dbt_run_staging >> dbt_run_warehouse >> dbt_run_marts
