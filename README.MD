# 文档
[主题文档](https://doc.klein.com/pages/a2f161/#%E7%89%B9%E6%80%A7)

### 使用的是：vuepress-theme-vdoing 主题
### 本地运行 
运行下面命令：
```
npm run dev
```
### docker 方式部署 
运行下面命令：
```
sh docker_deploy.sh
```
### 评论系统
评论系统使用 Gitalk 插件,在/config/plugins.js文件中配置
Gitalk demo：https://gitalk.github.io/
Gitalk github：https://github.com/gitalk/gitalk
[官方文档](https://github.com/gitalk/gitalk/blob/master/readme-cn.md)

* 在Github上新建一个仓库用于存储评论：blog-comment
* 在Github上新建[ OAuth application](https://github.com/settings/applications/new)，并配置。
+ 注意：Application name 不能和评论仓库名称一样，Homepage URL和Authorization callback URL都配置成博客网站的域名。然后点击生成Client secrets。
* 配置Gitalk插件到项目中：
```
module.exports = {
  plugins: [
    [
      'vuepress-plugin-comment',
      {
        choosen: 'gitalk', 
        options: {
          clientID: 'a6e*******4709b88b',
          clientSecret: 'f0e***************beb8b2d54d7241',
          repo: 'blog-comment', // GitHub 评论仓库的名称
          owner: 'shuailee', // GitHub仓库所有者
          admin: ['shuailee'], // 对仓库有写权限的人
          distractionFreeMode: false 
        }
      }
    ]
  ]
}
```

