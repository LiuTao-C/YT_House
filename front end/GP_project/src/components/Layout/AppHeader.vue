<script setup lang="ts">

import {getInfo,logout} from "@/api/users"
import { useTokenStore } from "@/stores/mytoken";
import { ElMessage, ElMessageBox } from "element-plus";
import { reactive, ref } from "vue";
import { useRouter } from "vue-router";
const router = useRouter()
//先是默认值，为空
const userInfo = ref({portrait:"",userName:""})
//拿到数据，再显示出来
// getInfo().then((res) => {
//   console.log(res)
//   userInfo.value = res.data.content
// })
// getInfo().then((res) => {
//   console.log(res)
//   userInfo.value = res.data.content
// })
//退出事件
const handleLogout =async ()=>{
  //询问，确认
  await ElMessageBox.confirm("确认退出？","退出询问",{
    confirmButtonText:"确认",
    cancelButtonText:"取消",
    type:'warning'
  }).catch(()=>{ElMessage.info("取消操作")
    return new Promise(()=>{})

  })
  //执行退出
  
  await logout().catch(()=>{})
  ElMessage.success("用户成功退出!")
  //清除token信息，跳转到login
  window.localStorage.removeItem("TokenInfo");
  const store = useTokenStore()

  router.push({name:"login"})
}
</script>

<template>
    <el-header>
        <el-icon :size="32"><Expand /></el-icon>
        
    
    <!-- 面包屑 -->
    <el-breadcrumb separator="/">
    <el-breadcrumb-item :to="{ path: '/' }">主页</el-breadcrumb-item>
    <el-breadcrumb-item
      ><a href="/"></a></el-breadcrumb-item
    >

  </el-breadcrumb>

  <!-- 下拉菜单视图 -->
  <el-dropdown>
    <span class="el-dropdown-link">
        
        <el-avatar :size="36" :src=" 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'" />
      <el-icon class="el-icon--right">
        <arrow-down />
      </el-icon>
    </span>
    <template #dropdown>
      <el-dropdown-menu>
        <el-dropdown-item>管理员</el-dropdown-item>
        <el-dropdown-item divided  @click="handleLogout">退出登录</el-dropdown-item>
      </el-dropdown-menu>
    </template>
  </el-dropdown>
</el-header>
</template>

<style lang="scss" scoped>
.el-header{
    display: flex;
    background-color: #eee;
    align-items: center;
    .el-icon{ 
        margin-right: 17px;}

}

.el-dropdown{
   display: flex;
    margin-left: auto;
    align-items: center;
    justify-content: center; // 将内容水平居中对齐
    .el-dropdown-link {
      display: flex;
      justify-content: center; // 将内容水平居中对齐
      align-items: center;
      .el-icon--right {
        margin-left: 10px; // 调整箭头图标的位置
      }
    }
}


</style>