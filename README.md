# svnWinLimit

## 彻底删除SVN服务器的文件

作为部门SVN管理员，最忍受不了有人把超大的软件安装包传到文档服务器上。
今天实在是受不了了，把大文件都转移到了FTP上，但是删除SVN服务器上的文件实在太玛麻烦了，需要如下操作：

    svnadmin dump e:\Repositories\DOC > docex02.dump
    svndumpfilter exclude --targets exclude.txt <docex02.dump> docex04.dump
    svnadmin create e:\Repositories\DOCnew
    svnadmin load e:\Repositories\DOCnew < docex04.dump

其中exclude.txt是一个文本文件，每个要排除的路径一行，比如：

    02期/04开发&设计/源端安装程序
    bi/12培训及代码/tools
    bd/3.0会议/02期
    am/90资料/01期

然后再把DOC里conf里的文件拷贝到DOCnew里，吧DOCnew改为DOC即可。

## 限制SVN提交文件的大小

然后就是怎么限制不让人再提交过大的文件，在网上找了一圈只有Linux的版本，没有Windows的pre-commit.bat，于是自己写一个吧，效果还不错。

本文件限制上传大小为150M，是字节数。可以根据需要修改文件大小和注释。

文件放到SVN资源库的hooks目录下。

希望能帮到大家^_^

This procedure for the Windows version of the limit Upload SVN file size to 150M, is the number of bytes.
You can change the file size and message in the program as needed. Put it into the folder hooks,

顺便宣传下我的动漫图片壁纸站：http://www.aicookie.com/ 

