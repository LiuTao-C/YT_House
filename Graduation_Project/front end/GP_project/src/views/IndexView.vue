<template>
  <div class="page">
    <div class="header">
      <h1 class="welcome-title">欢迎使用民航质量管理系统</h1>
    </div>
    <div class="content">
      <h2 class="manual-title">用户操作手册</h2>
      <div class="manual-item">
        <h3>审计功能</h3>
        <p>通过左侧菜单中的审计 -&gt; 新建审计来新建审计表单。</p>
        <p>通过审计 -&gt; 列表视图可以查看已上传的审计表单。</p>
        <p>点击表单条目的查看按钮即可查看和修改详细表单。</p>
        <p>点击表单条目的删除按钮即可删除对应的表单信息。</p>
        <h3>报告功能</h3>
        <p>通过左侧菜单中的报告 -&gt; 新建报告来新建报告表单。并且可以上传具体报告文件</p>
        <p>通过报告 -&gt; 列表视图可以查看已上传的表单。</p>
        <p>点击表单条目的查看按钮即可查看和修改详细表单。且可以下载相关文件</p>
        <p>点击表单条目的删除按钮即可删除对应的表单信息。</p>
        <h3>文档功能</h3>
        <p>通过左侧菜单中的附加文档 -&gt; 列表视图来查看所有的文档信息 </p>
        <p>点击表单条目的下载按钮，即可以下载相关文件</p>
        <h3>其他功能类似审计功能</h3>
      </div>
      <!-- 其他操作手册内容 -->
    </div>
  </div>
</template>

<script>
export default {
  // 逻辑代码
}
</script>

<style scoped>
.page {
  padding: 20px;
}

.header {
  text-align: left;
  margin-bottom: 30px;
}

.welcome-title {
  font-size: 48px;
  color: #007bff; /* 蓝色 */
  margin-top: 0;
  margin-bottom: 0;
}

.content {
  max-width: 800px;

}

.manual-title {
  font-size: 24px;
  color: #555; /* 深灰色 */
  margin-bottom: 20px;
}

.manual-item h3 {
  
  margin-bottom: 10px;
  color: #333; /* 深灰色 */
}

.manual-item p {
  margin-bottom: 5px;
  color: #666; /* 中灰色 */
}

.manual-item {
  text-align: left;
}
</style>
