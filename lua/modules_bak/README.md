
#### Packer 插件的选项说明
```lua
use {  
  'myusername/example',        -- 插件位置字符串  
  指定加载插件后要运行的代码。  
  disable = boolean,           -- 将插件标记为不活动  
  as = string,                 -- 指定用于安装插件的别名  
  installer = function,        -- 指定自定义安装程序。请参阅下面的“定制安装程序”。  
  updater = function,          -- 指定自定义更新。请参阅下面的“定制安装程序”。  
  after = string or list,      -- 指定要在此插件之前加载的插件。请参阅下面的“排序”  
  rtp = string,                -- 指定要添加到rununtimepath的插件的子目录。  
  opt = boolean,               -- 手动标记插件为可选。  
  branch = string,             -- 指定要使用的git分支  
  tag = string,                -- 指定要使用的git标记。“最新标签”支持“*”  
  commit = string,             -- 指定要使用的git提交  
  lock = boolean,              -- 在updates/syncs中跳过更新这个插件。还清洗。  
  run = string, function, or table, -- 后更新/安装钩。看到“更新/安装钩子”。  
  requires = string or list,   -- 指定插件依赖关系。看到“依赖性”。  
  rocks = string or list,      -- 为插件指定Luarocks依赖项  
  config = string or function, -- 指定加载插件后要运行的代码。-- The setup key implies opt = true  
  setup = string or function,  -- 指定插件加载前要运行的代码。  
  -- The following keys all imply lazy-loading and imply opt = true  
  cmd = string or list,        -- 指定加载此插件的命令。可以是一个自动cmd模式。  
  ft = string or list,         -- 指定加载此插件的文件类型。  
  keys = string or list,       -- 指定加载此插件的映射。看到“快捷键”。  
  event = string or list,      -- 指定加载此插件的自动命令事件。  
  fn = string or list          -- Specifies functions which load this plugin.  
  cond = string, function, or list of strings/functions,   -- 指定加载此插件的条件测试  
  module = string or list      -- 为require指定Lua模块名称。当需要一个字符串开始使用其中一个模块名，插件将被加载。  
  module_pattern = string/list -- 为require指定Lua模块名称的Lua模式。当需要匹配这些模式之一的字符串时，插件将被加载。  
}
```
