[Fuente nana](https://www.youtube.com/watch?v=qP8kir2GUgo&t=70s)

[_TOC_]

# GitLab CI/CD

Con GitLab CI/CD permite definir pipelines en un archivo `.gitlab-ci.yml` dentro de tu repositorio, que GitLab utiliza para ejecutar varias etapas y trabajos para construir, probar y desplegar código.

## Conceptos Clave de GitLab CI/CD

1. **Pipeline**: Un pipeline es una colección de trabajos y etapas que se ejecutan en un orden específico. Los pipelines se definen en el archivo `.gitlab-ci.yml` y pueden ser activados por varios eventos como commits, merge requests o horarios programados.

2. **Stages**: Las stages son agrupaciones lógicas de trabajos que se ejecutan secuencialmente. Por ejemplo, podrías tener stages como `build`, `test` y `deploy`. Los jobs dentro de la misma stage se ejecutan en paralelo, y la siguiente stage comienza solo después de que todos los jobs en la stage actual se completen exitosamente.

3. **Jobs**: Los jobs son tareas individuales que ejecutan comandos en el runner. Cada job pertenece a una etapa y puede ser configurado con parámetros específicos, como scripts para ejecutar, entornos y condiciones para ejecutarse.

4. **Runners**: Los runners son agentes que ejecutan los jobs definidos en el archivo `.gitlab-ci.yml`. GitLab proporciona runners compartidos, o puedes configurar tus propios runners específicos para tener más control sobre el entorno de ejecución.

5. **Artifacts**: Los Artifacts son archivos generados por jobs que pueden ser compartidos entre diferentes stages o descargados. Son útiles para pasar datos, como binarios compilados o informes de pruebas, entre jobs.

6. **Environments**: Los Environments representan targets de despliegue, como desarrollo, staging y producción. GitLab CI/CD puede desplegar código en estos entornos y gestionar el ciclo de vida del despliegue.


## Workflow del Pipeline CI/CD

1. **Definir el Pipeline**: Crear un archivo `.gitlab-ci.yml` en la raíz del repositorio. Definir las stages y jobs a incluir en el pipeline.

Ejemplo de Archivo `.gitlab-ci.yml`

```yaml
stages:
  - build
  - test
  - deploy

build-job:
  stage: build
  script:
    - echo "Construyendo el proyecto..."
    - make build
  artifacts:
    paths:
      - build/

test-job:
  stage: test
  script:
    - echo "Ejecutando pruebas..."
    - make test

deploy-job:
  stage: deploy
  script:
    - echo "Desplegando el proyecto..."
    - make deploy
  environment:
    name: production
    url: https://miapp.ejemplo.com
  only:
    - main
```

2. **Commit y Push**: Commit del archivo `.gitlab-ci.yml` y push al repositorio GitLab. Esto activará el pipeline para ejecutarse basado en la configuración definida.

3. **Ver Estado del Pipeline**: En la interfaz web de GitLab en la sección "CI / CD". Esta sección proporciona información detallada sobre cada stage y job, incluidos los registros y resultados.

4. **Depurar e Iterar**: Si los jobs fallan o producen resultados inesperados, se puede depurar examinando los logs y salidas. Hacer cambios necesarios en el archivo `.gitlab-ci.yml` y pushear las actualizaciones para refinar el pipeline.

