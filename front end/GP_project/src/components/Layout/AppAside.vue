<script setup lang="ts">

</script>

<template>
  <el-aside >
    <el-menu router unique-opened>
      <a href="/" class="logo">
        <img src="@/components/font/飞机.png" alt="" />
        <h3>民航质量管理系统</h3>
      </a>
      <el-sub-menu  index="1">
        <template #title>
          <el-icon><IEpSetting></IEpSetting></el-icon>
          <span>审计</span>
        </template>
        <el-menu-item-group >
          <el-menu-item  index="/newaudit"> <span>新的审计</span></el-menu-item>
        </el-menu-item-group>
        <el-menu-item-group >
          <el-menu-item index="/auditlistview"> <span>列表视图 </span></el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="2">
        <template #title>
          <el-icon><icon-menu /></el-icon>
          <span>行动</span>
        </template>
        <el-menu-item-group >
          <el-menu-item index="/newactview"> <span>新的行动</span></el-menu-item>
        </el-menu-item-group>
        <el-menu-item-group >
          <el-menu-item index="/actlistview"> <span>列表视图</span></el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="3">
        <template #title>
          <el-icon><icon-menu /></el-icon>
          <span>报告</span>
        </template>
        <el-menu-item-group >
          <el-menu-item index="/newreportview"> <span>新的报告</span></el-menu-item>
        </el-menu-item-group>
        <el-menu-item-group >
          <el-menu-item index="/reportlistview"> <span>列表视图</span></el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="4">
        <template #title>
          <el-icon><icon-menu /></el-icon>
          <span>危险日志</span>
        </template>
        <el-menu-item-group >
          <el-menu-item index="/newhazard"> <span>新的日志</span></el-menu-item>
        </el-menu-item-group>
        <el-menu-item-group >
          <el-menu-item index="/hazardlistview"> <span>列表视图</span> </el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="5">
        <template #title>
          <el-icon><icon-menu /></el-icon>
          <span>赞助商</span>
        </template>
        <el-menu-item-group >
          <el-menu-item index="/newsupporter"> <span>新的赞助商</span></el-menu-item>
        </el-menu-item-group>
        <el-menu-item-group >
          <el-menu-item index="/supportlist"> <span>列表视图</span> </el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="6">
        <template #title>
          <el-icon><icon-menu /></el-icon>
          <span>附加文档</span>
        </template>
        <el-menu-item-group >
          <el-menu-item index="/documentlist"> <span>列表视图</span> </el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
    </el-menu>

  </el-aside>
</template>

<style scoped lang="scss">
.logo{
  display: flex;
  justify-content: center;
  align-items: center;
  text-decoration: none;
  color: black;  
  img{
    width: 32px;
    height: 32px;
  }
  h1{
    font-size: 20px;
    margin-left: 10px;
  }
}
.el-aside{
  background-color: #eee;
  height: 100vh;
  width:auto;
}
.el-menu{
  background-color: #eee;
  width:200px;
}
</style>