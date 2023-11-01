
Table of Contents
- [Firsts Steps](#firsts-steps)
- [Basics](#basics)
  - [File States](#file-states)
  - [GIT Project areas](#git-project-areas)
- [Commands](#commands)
  - [usuario](#usuario)
  - [`init`](#init)
  - [`status`](#status)
  - [`add`](#add)
  - [`commit`](#commit)
  - [`log`](#log)
  - [`restore/checkout`](#restorecheckout)
  - [`reset`](#reset)
  - [`stash`](#stash)
  - [`diff`](#diff)
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

![img](images/git.png)

### File States

**Modified:** files modified but not committed.

**Staged:** files marked for next commit.

**Committed:** committed files in the repository. 

### GIT Project areas

**Working directory:** copia de una versión del proyecto..

**Staging area:** file usually contained in your Git directory, which stores information about what will go into your next commit. It works like a list or index, indicating which files will be committed.

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
### `init`
Inicializar un Proyecto Nuevo:
	Crea una carpeta .git dentro del **Working directory**, con confguraciones propias de git
```bash
git init
```
### `status`
Info acerca de branch actual, commits realizados y archivos en **Staging area**
```bash
git status
```
### `add`
Agregar archivo al **Staging area**
```bash
git add cambiar_host.sh
```
Agregar directorio completo (con subdirectorios) al **Staging area**. Ignora los archivos ocultos
```bash
git add .
```
### `commit`
Tomar los archivos del **Staging area** y commitearlos al repositorio local
```bash
git commit
```
```bash
git commit -m "Mensaje del commit"
```
### `log`
Listar commit realizados
```bash
git log
```
### `restore/checkout`
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

### `reset`
Used to move the HEAD (the currently checked-out commit) and the branch pointer to a different commit.
`git reset` is often used to undo commits, move branches to different commits, or unstage changes.

1. **`git reset --soft`**: This mode moves the branch pointer and the HEAD to a different commit while keeping your changes in the staging area. It effectively "uncommits" the changes, allowing you to make further adjustments before creating a new commit. For example:
   
    ```bash
    git reset --soft HEAD~1
    ```

2. **`git reset --mixed` (default mode)**: This mode is similar to `--soft`, but it also unstages the changes. Your changes are preserved in your working directory, and you can modify them further if needed. For example:

    ```bash
    git reset HEAD~1
    ```

3. **`git reset --hard`**: This is the most aggressive mode of `git reset`. It moves the branch pointer and the HEAD to a different commit, discards any changes in both the staging area and working directory, and reverts your project to the state of the specified commit. 
For example:

    ```bash
    git reset --hard HEAD~1
    ```

4. **`git reset <commit>`**: You can specify a particular commit (either by commit hash, branch name, or reference) to which you want to reset the branch and HEAD. This allows you to move the branch to a specific commit without necessarily using the `--soft`, `--mixed`, or `--hard` options.

### `stash`
In Git, the `git stash` command is used to temporarily save changes that you've made to your working directory but do not want to commit yet. It's a handy feature for situations where you're in the middle of working on something, but you need to switch to a different branch or work on another task without committing your changes. `git stash` allows you to store your changes, switch branches, and then later reapply those changes.

Here's how `git stash` works:

1. **Stash Changes**: You can use `git stash save` to stash your changes. Optionally, you can provide a message to describe the stash. For example:

    ```bash
    git stash save "Work in progress on feature X"
    ```

2. **Switch Branch**: After stashing your changes, you can switch to a different branch using the `git checkout` command. This allows you to work on another task or make changes in a different context.

    ```bash
    git checkout other-branch
    ```

3. **Reapply Stashed Changes**: When you're ready to continue working on the changes you stashed, you can reapply them to your working directory. Use the `git stash apply` command followed by the stash reference, which can be the stash number or a unique identifier.

    ```bash
    git stash apply stash@{0}
    ```

    If you want to remove the changes from the stash after applying them, you can use `git stash pop`:

    ```bash
    git stash pop stash@{0}
    ```

4. **List Stashes**: You can view the list of stashes with `git stash list`. This shows you all your stashed changes and their descriptions.

    ```bash
    git stash list
    ```

5. **Delete Stash**: If you no longer need a specific stash, you can delete it using `git stash drop`:

    ```bash
    git stash drop stash@{0}
    ```

6. **Clear All Stashes**: To remove all stashes, you can use `git stash clear`:

    ```bash
    git stash clear
    ```
    
### `diff`
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
![img](images/branches.png)

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