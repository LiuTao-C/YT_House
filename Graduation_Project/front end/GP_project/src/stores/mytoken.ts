import { ElMessage } from "element-plus"
import {defineStore} from "pinia"
import { ref, computed } from 'vue'

interface Token{
    token:  string;
}
export const useTokenStore = defineStore("mytoken" ,()=>{
   //   ref相当于state
    const tokenJson = ref("")
    //computed 相当于getters
    const token = computed<String>( () =>{
        return tokenJson.value || window.localStorage.getItem("TokenInfo") || "";
    })
    //function 相当于actions
    function saveToken(data:string){
        tokenJson.value = data
        window.localStorage.setItem("TokenInfo",data)
    }

    //向外暴露
    return {token,saveToken}
    })
