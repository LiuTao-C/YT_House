// FileUploadComposable.ts
import { ref, Ref } from 'vue';

export function useFileUpload() {
  const fileList: Ref<any[]> = ref([]);

  const handleFileChange = (files: any[]) => {
    fileList.value = files;
  };

  return { fileList, handleFileChange };
}
