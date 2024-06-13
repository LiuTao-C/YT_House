<template>
  <div class="common-layout">
    <el-container>
    <AppAside/>
      <el-container class="header-and-main">
        <AppHeader/>
        <el-main>
          <!-- 主题位置留白，添加自定义滚动条-->
          <el-scrollbar>
          <RouterView/></el-scrollbar>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>



<script>
import AppAside from "@/components/Layout/AppAside.vue";
import AppHeader from "@/components/Layout/AppHeader.vue";
export default {
  components: {AppAside,AppHeader},
  setup() {


    return {}
  }
}
</script>

<style lang="scss" scoped>
  .header-and-main{
    flex-direction: column;
    height: 100vh;
    background-color: #f8f9fa;
  }

</style>