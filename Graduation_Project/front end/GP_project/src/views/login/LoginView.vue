<template>
  <div class="login">
    <div class="header">
      
      <h1 class="welcome-text">基于Quarkus的民航质量管理系统</h1>
    </div>
    <el-form :model="form" :rules="rules" ref="formRef" label-width="120px" size="large" label-position="top">
      <h2>登录</h2>
      <el-form-item label="账号" prop="username" >
        <el-input v-model="form.username" placeholder="请输入账号" />
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input v-model="form.password" type="password"  placeholder="请输入密码"/>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit" :loading="isLoading">登录</el-button>
        <!-- <el-button>取消</el-button> -->
      </el-form-item>
    </el-form>
  </div>
</template>



<style lang="scss" scoped>
body {
  margin: 0;
  padding: 0;
  overflow: hidden;
  height: 100%;
}
.login {
  background: linear-gradient(to bottom right, #7ec8e3, #92ccd4); /* 天蓝渐变色 */
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 20px;

  .header {
    display: flex;
    align-items: center;
    margin-bottom: 30px;

    .airplane-icon {
      width: 50px;
      height: auto;
      margin-right: 20px;
    }

    h1 {
      // color: #fff;
      font-size: 26px;
    }
    .welcome-text {
      color: #fff;
      font-size: 38px; /* 调大字体 */
    }
  }

  .el-form {
    //background-color: rgba(255, 255, 255, 0.8); /* 半透明白色 */
    width: 300px;
    padding: 30px;
    border-radius: 20px;

    .el-form-item {
      margin-top: 20px;
    }

    .el-button {
      width: 100%;
      margin-top: 30px;
    }
  }
  .input-row {
  display: flex;
  align-items: center;
}

}
</style>




<style lang="scss" scoped>
.login{
  //background-color: #eee;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  .el-form{
      background-color: #fff;
      width: 300px;
      padding: 30px;
      border-radius: 20px;
      .el-form-item{
          margin-top: 20px;
      }
      .el-button{
          width: 100%;
          margin-top: 30px;
      }
  }
}
</style>
<script lang="ts" setup>
import { login } from '@/api/users';
import { reactive ,ref} from '@vue/reactivity'
import { ElMessage, FormInstance, FormRules } from 'element-plus';
import {useRouter,useRoute} from 'vue-router'
import { useTokenStore } from '@/stores/mytoken'; 
const router = useRouter()
const route = useRoute()
const store = useTokenStore()
  const form = reactive({
      username: '',
      password: '',
  })
  //登陆事件
  const onSubmit = async () =>{
      isLoading.value = true
      try{
      //表单校验
      await formRef.value?.validate();
      
      
      }catch(err){
          ElMessage.error("出错")
          isLoading.value = false    
          throw err}
      // ElMessage.success('登录成功');
  
  
  //正式发送登录请求
  // 清除 localStorage 中存储的 TokenInfo
  window.localStorage.removeItem("TokenInfo");
  const data = await login(form).then((res) => {
      if(res.data.code!==200) {
          ElMessage.error("登录信息有误");
          isLoading.value = false  
          throw new Error("登录信息有误")
      }
      return res.data
          })
      console.log(data)

      isLoading.value = false

  //保存token信息
  store.saveToken(data.data)
  const abc = window.localStorage.getItem("TokenInfo")
ElMessage.success(abc as string);
  ElMessage.success("登陆成功!")
  router.push((route.query.redirect as string)||"/")
  }
  //定义是否登录加载中
  const isLoading = ref(false)
  //定义form表单校验规则
  const formRef = ref<FormInstance>();
      //定义表单校验
      const rules = reactive<FormRules>({
      username:[{
          required: true,  message: '请输入账号',trigger: 'blur'},
          { min: 3, max: 10,message: "请输入正确手机号",trigger: "blur",}
      ],
      password:[{ required: true,  message: '请输入密码',trigger: 'blur'},
      { min: 3, max: 10,message: "密码的长度在3到10之间",trigger: "blur",}           
  ]
  }) 
</script>