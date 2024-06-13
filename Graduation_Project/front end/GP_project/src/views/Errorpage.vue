<template>
  <div class="error-page">
    <div class="error-container">
      <h1 class="error-code">404</h1>
      <p class="error-message">页面未找到</p>
      <button class="back-button" @click="goBack">返回</button>
    </div>
  </div>
</template>

<script>
import router from '@/router';

export default {
  methods: {
    goBack() {
    router.push('/'); // 使用正确的主页路径，这里是 '/'
    }
  }
}
</script>

<style scoped>
.error-page {
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #f8f9fa;
}

.error-container {
  text-align: center;
}

.error-code {
  font-size: 72px;
  color: #dc3545;
}

.error-message {
  font-size: 24px;
  margin-bottom: 30px;
}

.back-button {
  padding: 10px 20px;
  font-size: 18px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.back-button:hover {
  background-color: #0056b3;
}
</style>
