
Table of contents
- [Firsts Steps](#firsts-steps)
- [Basics](#basics)
  - [Estados de los archivos](#estados-de-los-archivos)
  - [Áreas de un proyecto GIT](#áreas-de-un-proyecto-git)
- [Commands](#commands)
  - [usuario](#usuario)
  - [init](#init)
  - [status](#status)
  - [add](#add)
  - [commit](#commit)
  - [log](#log)
  - [restore/checkout](#restorecheckout)
  - [diff](#diff)
  - [ignore](#ignore)
- [Branches](#branches)
  - [list branch](#list-branch)
  - [Crear nuevo Branch](#crear-nuevo-branch)
  - [Switch a un Branch local](#switch-a-un-branch-local)
  - [Switch a un Branch remoto](#switch-a-un-branch-remoto)
  - [Merge](#merge)
  - [Eliminar Branches](#eliminar-branches)

## Firsts Steps
1 - Go to https://github.com
2 - Create a new project 
3 - Got to Settings->SSH
4 - Add a new SSH Key and paste yout public SSH Key

## Basics

![img](git.png)

### Estados de los archivos

**Modified:** archivos modificados pero no commiteados.

**Staged:** archivos marcados para el próximo commit.

**Committed:** archivos commiteados en el repositorio. 

### Áreas de un proyecto GIT

**Working directory:** copia de una versión del proyecto..

**Staging area:** archivo generalmente contenido en tu directorio de Git, que almacena información acerca de lo que va a ir en tu próxima confirmación. Funciona como una lista o indice, indicando que archivos iran para el commit.

**Directorio de Git:** repositorio.

## Commands
### usuario
Indicar correo del usuario actual que va a trabajar en el proyecto
```bash
git config --global user.email "usuario@unsj.edu.ar"
```
Indicar nombre del usuario actual que va a trabajar en el proyecto
```bash
git config --global user.name "Nombre"
```
### init
Inicializar un Proyecto Nuevo:
	Crea una carpeta .git dentro del **Working directory**, con confguraciones propias de git
```bash
git init
```
### status
Info acerca de branch actual, commits realizados y archivos en **Staging area**
```bash
git status
```
### add
Agregar archivo al **Staging area**
```bash
git add cambiar_host.sh
```
Agregar directorio completo (con subdirectorios) al **Staging area**. Ignora los archivos ocultos
```bash
git add .
```
### commit
Tomar los archivos del **Staging area** y commitearlos al repositorio local
```bash
git commit
```
```bash
git commit -m "Mensaje del commit"
```
### log
Listar commit realizados
```bash
git log
```
### restore/checkout
Revertir archivos modificados. Listar los archivos que cambiaron:
```bash
git status
```
Revertir archivo
```bash
git restore nombre_archivo
```
o
```bash
git checkout -- nombre_archivo
```
### diff
Ver cambios hechos en un archivo, comparando el archivo en el repositorio con el modificado
```bash
git diff nombre_archivo
```
### ignore
Si queremos ignorar la carpeta test y el archivo ignorar.txt, en la raiz del proyecto:
```bash
nano .gitignore
```
En el interior colocar:
```bash
test
ignorar.txt
```
Agregar al Staging area:
```bash
git add .gitignore
```
Commitear el gitignore
```bash
git commit -m "Agregar archivo .gitignore"
```

## Branches
![img](branches.png)

### list branch
Bbranch locales:
```bash
git branch
```
Branch remotos:
```bash
git branch -r
```
Branch locales y remotos:
```bash
git branch -a
```
### Crear nuevo Branch
Luego de crear el branch, los commit se hacen sobre el mismo
```bash
git checkout -b my-branch-name
```
### Switch a un Branch local
Cambiar a un Branch del repo local
```bash
git checkout my-branch-name
```
### Switch a un Branch remoto
Listar los Branch del repo remoto:
```bash
git pull
```
Elegir un Branch remoto y cambiar al mismo
```bash
git checkout --track origin/my-branch-name
```bash
```
Push a un Branch
Si el Branch local no existe en el repo remoro, ejecutar:
```bash
git push -u origin my-branch-name
```
O
```bash
git push -u origin HEAD
```
:::note
HEAD es una referencia al branch actual, por lo que es una forma fácil de hacer un push a un branch del mismo nombre en el repo remoto. ¡Esto evita tener que tipear el nombre exacto de la rama!
:::

### Merge
Primero, asegurarse que esté todo ok 
```bash
git status
```
Checkout al branch en el que se desea mergear otro branch (los cambios se mergearan en ese branch). Si aún no está en el branch deseado, ejecutar:
```bash
git checkout master
```
:::note 
Replace master with another branch name as needed.
:::
Mergear otro branch al branch actual:
```bash
git merge my-branch-name
```
### Eliminar Branches
Eliminar branch local
```bash
git branch -d my-branch-name
```
O
```bash
git branch -D my-branch-name
```
:::note
The -d option only deletes the branch if it has already been merged. The -D option is a shortcut for --delete --force, which deletes the branch irrespective of its merged status.
:::
Eliminar branch remoto
```bash
git push origin --delete my-branch-name
```
