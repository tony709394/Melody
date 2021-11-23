<p align="center"><img src="https://raw.githubusercontent.com/tony709394/Melody/main/Images/logo.png" align="center" width="175"></p>
<h1 align="center">Melody</h1>

Language: English | [中文简体](README_zh_cn.md)

## What is Melody ?

A local data persistence library for Godot. This repository is inspired by the song [《Melody》](https://www.youtube.com/watch?v=ih6_xNsensA) sung by singer `Koji Tamaki`.

Memories are precious and so is data.

## Features

- Adding, updating, deleting, querying, one-click clearing, etc

- Three types of data are supported: `scene nodes (scn)`, `external resources (res)`, and `structural data (json)`

- Various types of data are allocated to separate storage partitions and do not affect each other

## Install

> Godot 3.0+ is supported.

- Download this repository

- Copy the directory named Hey into your project

- In the Godot editor, select "Project -> Project Settings -> AutoLoad"

- Add a script named Melody.gd

<p align="center"><img src="https://raw.githubusercontent.com/tony709394/Melody/main/Images/autoload.png" align="center"></p>

>  **Note:** After running the scene, the storage path is displayed in the console.
> 
> <img src="https://raw.githubusercontent.com/tony709394/Melody/main/Images/notification.png" align="center">

## Examples

> Take `structured data` as an example

```
# Add data / Modify data
var array_dict = [
    { "name": "happy", "want": "enjoy food", "positivity": 10 },
    { "name": "sad", "want": "calm down", "positivity": 2 },
    { "name": "normal", "want": "sleep", "positivity": 6 },
]
var success = Melody.struct.SET(array_dict, "/player/mood")

# Get data
var array_dict = Melody.struct.GET("/player/mood")

# Delete data
var success = Melody.struct.DELETE("/player/mood")

# Check if the data already exists
var success = Melody.struct.has("/player/mood")

# Show all data paths
var array_path = Melody.struct.list()

# Delete all data
var success = Melody.struct.clean()
```

## API

### Melody.scn.SET

- Description: Add or modify `scene nodes (scn)` data

- Output: `Boolean`

- Input: `Node, String`

- Usage:

```
var success = Melody.scn.SET(self, "/tree/tree1")
```

### Melody.scn.GET

- Description: Get `scene nodes (scn)` data

- Output: `Node`

- Input: `String`

- Usage:

```
var node = Melody.scn.GET("/tree/tree1")
parent.add_child(node)
```

### Melody.scn.DELETE

- Description: Delete `scene nodes (scn)` data

- Output: `Boolean`

- Input: `String`

- Usage:

```
var success = Melody.scn.DELETE("/tree/tree1")
```

### Melody.scn.has

- Description: Check if `scene nodes (scn)` data already exists

- Output: `Boolean`

- Input: `String`

- Usage:

```
var success = Melody.scn.has("/tree/tree1")
```

### Melody.scn.list

- Description: Show all `scene nodes (scn)` data paths

- Output: `Array`

- Input: `Null`

- Usage:

```
var array_path = Melody.scn.list()
```

### Melody.scn.clean

- Description: Delete all `scene nodes (scn)` data

- Output: `Boolean`

- Input: `Null`

- Usage:

```
var success = Melody.scn.clean()
```

### Melody.res.SET

- Description: Add or modify `external resources (res)` data

- Output: `Boolean`

- Input: `Resource, String`

- Usage:

```
var success = Melody.res.SET(mesh, "/mesh/monkey")
```

### Melody.res.GET

- Description: Get `external resources (res)` data

- Output: `Resource`

- Input: `String`

- Usage:

```
var res_mesh = Melody.res.GET("/mesh/monkey")
i_mesh.mesh = res_mesh
```

### Melody.res.DELETE

- Description: Delete `external resources (res)` data

- Output: `Boolean`

- Input: `String`

- Usage:

```
var success = Melody.res.DELETE("/mesh/monkey")
```

### Melody.res.has

- Description: Check if the `external resources (res)` data already exists

- Output: `Boolean`

- Input: `String`

- Usage:

```
var success = Melody.res.has("/mesh/monkey")
```

### Melody.res.list

- Description: Show all `external resources (res)` data paths

- Output: `Array`

- Input: `Null`

- Usage:

```
var array_path = Melody.res.list()
```

### Melody.res.clean

- Description: Delete all `external resources (res)` data

- Output: `Boolean`

- Input: `Null`

- Usage:

```
var success = Melody.res.clean()
```

### Melody.struct.SET

- Description: Add or modify `structural data (json)` data

- Output: `Boolean`

- Input: `Array, String`

- Usage:

```
var array_dict = [
    { "name": "happy", "want": "enjoy food", "positivity": 10 },
    { "name": "sad", "want": "calm down", "positivity": 2 },
    { "name": "normal", "want": "sleep", "positivity": 6 },
]
var success = Melody.struct.SET(array_dict, "/player/mood")
```

> The first argument is an array of dictionaries, and each dictionary has the same structure.

### Melody.struct.GET

- Description: Get `structural data (json)` data

- Output: `Array`

- Input: `String`

- Usage:

```
var array_dict = Melody.struct.GET("/player/mood")
```

### Melody.struct.DELETE

- Description: Delete `structural data (json)` data

- Output: `Boolean`

- Input: `String`

- Usage:

```
var success = Melody.struct.DELETE("/player/mood")
```

### Melody.struct.has

- Description: Check if the `structural data (json)` data already exists

- Output: `Boolean`

- Input: `String`

- Usage:

```
var success = Melody.struct.has("/player/mood")
```

### Melody.struct.list

- Description: Show all `structural data (json)` data paths

- Output: `Array`

- Input: `Null`

- Usage:

```
var array_path = Melody.struct.list()
```

### Melody.struct.clean

- Description: Delete all `structural data (json)` data

- Output: `Boolean`

- Input: `Null`

- Usage:

```
var success = Melody.struct.clean()
```