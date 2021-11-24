<p align="center"><img src="https://raw.githubusercontent.com/tony709394/Melody/main/Images/logo.png" align="center" width="175"></p>
<h1 align="center">Melody</h1>

语言: [English](README.md) | 中文简体

## Melody 是什么 ?

Godot 库，用于本地数据持久化。该仓库灵感源于 `玉置浩二` 演唱的[《Melody》](https://www.youtube.com/watch?v=ih6_xNsensA)。

回忆珍贵，数据也一样。

## 特性

- 功能：增删改查、一键清空等

- 支持三种数据：`场景节点(scn)`、`外部资源(res)`、`结构数据(json)`

- 各种类型的数据 分配至独立的存储分区，互不影响

- 支持加密模式

## 安装

> 支持 Godot 3.0+

- 下载这个仓库

- 复制 Melody 目录 至 你的项目目录

- 在 Godot 编辑器中，选择 "项目 -> 项目管理 -> 自动加载"

- 添加脚本 Melody.gd

<p align="center"><img src="https://raw.githubusercontent.com/tony709394/Melody/main/Images/autoload.png" align="center"></p>

>  **注意:** 运行场景后，存储路径 显示在控制台。
> 
> <img src="https://raw.githubusercontent.com/tony709394/Melody/main/Images/notification.png" align="center">

## 示例

> 以 `结构数据` 为例

```
# 新增数据 / 修改数据
var array_dict = [
    { "name": "happy", "want": "enjoy food", "positivity": 10 },
    { "name": "sad", "want": "calm down", "positivity": 2 },
    { "name": "normal", "want": "sleep", "positivity": 6 },
]
var success = Melody.struct.SET(array_dict, "/player/mood")

# 获取数据
var array_dict = Melody.struct.GET("/player/mood")

# 删除数据
var success = Melody.struct.DELETE("/player/mood")

# 检查数据是否已存在
var success = Melody.struct.has("/player/mood")

# 显示所有数据路径
var array_path = Melody.struct.list()

# 删除所有数据
var success = Melody.struct.clean()
```

## API

### Melody.encrypt

- 描述: 设置全局密码，且只能设置一次。调用该方法后，所有读写操作自带加密

- 输出: `Boolean`

- 输入: `String`

- 用法:

```
var success = Melody.encrypt("123456")
print(success)
```

> **建议:** 为每个用户提供专属密码，防止黑客轻松读取文件。

### Melody.scn.SET

- 描述: 新增或修改 `场景节点(scn)` 数据

- 输出: `Boolean`

- 输入: `Node, String`

- 用法:

```
var success = Melody.scn.SET(self, "/tree/tree1")
```

### Melody.scn.GET

- 描述: 获取 `场景节点(scn)` 数据

- 输出: `Node`

- 输入: `String`

- 用法:

```
var node = Melody.scn.GET("/tree/tree1")
parent.add_child(node)
```

### Melody.scn.DELETE

- 描述: 删除 `场景节点(scn)` 数据

- 输出: `Boolean`

- 输入: `String`

- 用法:

```
var success = Melody.scn.DELETE("/tree/tree1")
```

### Melody.scn.has

- 描述: 检查 `场景节点(scn)` 数据是否已存在

- 输出: `Boolean`

- 输入: `String`

- 用法:

```
var success = Melody.scn.has("/tree/tree1")
```

### Melody.scn.list

- 描述: 显示所有 `场景节点(scn)` 数据路径

- 输出: `Array`

- 输入: `Null`

- 用法:

```
var array_path = Melody.scn.list()
```

### Melody.scn.clean

- 描述: 删除所有 `场景节点(scn)` 数据

- 输出: `Boolean`

- 输入: `Null`

- 用法:

```
var success = Melody.scn.clean()
```

### Melody.res.SET

- 描述: 新增或修改 `外部资源(res)` 数据

- 输出: `Boolean`

- 输入: `Resource, String`

- 用法:

```
var success = Melody.res.SET(mesh, "/mesh/monkey")
```

### Melody.res.GET

- 描述: 获取 `外部资源(res)` 数据

- 输出: `Resource`

- 输入: `String`

- 用法:

```
var res_mesh = Melody.res.GET("/mesh/monkey")
i_mesh.mesh = res_mesh
```

### Melody.res.DELETE

- 描述: 删除 `外部资源(res)` 数据

- 输出: `Boolean`

- 输入: `String`

- 用法:

```
var success = Melody.res.DELETE("/mesh/monkey")
```

### Melody.res.has

- 描述: 检查 `外部资源(res)` 数据是否已存在

- 输出: `Boolean`

- 输入: `String`

- 用法:

```
var success = Melody.res.has("/mesh/monkey")
```

### Melody.res.list

- 描述: 显示所有 `外部资源(res)` 数据路径

- 输出: `Array`

- 输入: `Null`

- 用法:

```
var array_path = Melody.res.list()
```

### Melody.res.clean

- 描述: 删除所有 `外部资源(res)` 数据

- 输出: `Boolean`

- 输入: `Null`

- 用法:

```
var success = Melody.res.clean()
```

### Melody.struct.SET

- 描述: 新增或修改 `结构数据(struct)` 数据

- 输出: `Boolean`

- 输入: `Array, String`

- 用法:

```
var array_dict = [
    { "name": "happy", "want": "enjoy food", "positivity": 10 },
    { "name": "sad", "want": "calm down", "positivity": 2 },
    { "name": "normal", "want": "sleep", "positivity": 6 },
]
var success = Melody.struct.SET(array_dict, "/player/mood")
```

> 第一个参数是 字典数组，而且，每个字典结构相同。

### Melody.struct.GET

- 描述: 获取 `结构数据(struct)` 数据

- 输出: `Array`

- 输入: `String`

- 用法:

```
var array_dict = Melody.struct.GET("/player/mood")
```

### Melody.struct.DELETE

- 描述: 删除 `结构数据(struct)` 数据

- 输出: `Boolean`

- 输入: `String`

- 用法:

```
var success = Melody.struct.DELETE("/player/mood")
```

### Melody.struct.has

- 描述: 检查 `结构数据(struct)` 数据是否已存在

- 输出: `Boolean`

- 输入: `String`

- 用法:

```
var success = Melody.struct.has("/player/mood")
```

### Melody.struct.list

- 描述: 显示所有 `结构数据(struct)` 数据路径

- 输出: `Array`

- 输入: `Null`

- 用法:

```
var array_path = Melody.struct.list()
```

### Melody.struct.clean

- 描述: 删除所有 `结构数据(struct)` 数据

- 输出: `Boolean`

- 输入: `Null`

- 用法:

```
var success = Melody.struct.clean()
```