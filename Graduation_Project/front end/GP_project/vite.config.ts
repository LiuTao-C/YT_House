import { fileURLToPath, URL } from 'node:url'

import { defineConfig ,loadEnv} from 'vite'
import vue from '@vitejs/plugin-vue'
import path from 'path'
// https://vitejs.dev/config/
const srcPath = fileURLToPath(new URL('./src', import.meta.url));

export default defineConfig({
  server: {
    proxy: {      //代理方式访问
      // '/v2': {    //v2/bilihot
      //     target:loadEnv("",process.cwd()).VITE_API_BASE_URL,  //'https://tenapi.cn/',
      //     changeOrigin: true,
      // },
      '/auditlist/':{
          target:loadEnv("",process.cwd()).VITE_API_BASE_URL,  //'https://tenapi.cn/',
          changeOrigin: true,
      },
      '/user':{
        target:loadEnv("",process.cwd()).VITE_API_BASE_URL,  //'https://tenapi.cn/',
        changeOrigin: true,
    },
    '/actionlist/':{
      target:loadEnv("",process.cwd()).VITE_API_BASE_URL,  //'https://tenapi.cn/',
      changeOrigin: true,
    },
    '/upload/':{
      target:loadEnv("",process.cwd()).VITE_API_BASE_URL,  //'https://tenapi.cn/',
      changeOrigin: true,
    },
    '/front':{
      target:loadEnv("",process.cwd()).VITE_API_Login_URL,  //'http://localhost:8080',
      changeOrigin: true,
    },
    '/reportlist/':{
      target:loadEnv("",process.cwd()).VITE_API_BASE_URL,  //'http://localhost:8080',
      changeOrigin: true,
    },
    '/download/':{
      target:loadEnv("",process.cwd()).VITE_API_BASE_URL,  //'http://localhost:8080',
      changeOrigin: true,
    },
    '/file/':{
      target:loadEnv("",process.cwd()).VITE_API_BASE_URL,  //'http://localhost:8080',
      changeOrigin: true,
    },
    '/hazardlog/':{
      target:loadEnv("",process.cwd()).VITE_API_BASE_URL,  //'http://localhost:8080',
      changeOrigin: true,
    },
    '/support/':{
      target:loadEnv("",process.cwd()).VITE_API_BASE_URL,  //'http://localhost:8080',
      changeOrigin: true,
    },
    '/login':{
      target:loadEnv("",process.cwd()).VITE_API_BASE_URL,  //'http://localhost:8080',
      changeOrigin: true,
    }
  }
},
  plugins: [vue()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, 'src'),
    },
  },
  define: {
    'process.env': process.env,
  },
});
